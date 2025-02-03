//
//  HomeWorker.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import RxSwift

/// **HomeWorker**
/// Responsável por realizar o GET da url da lista de reposiórios de acordo com a url passada
protocol HomeWorkingProtocol: AnyObject {
    func getRepoList(page: String) -> Observable<RepositoriesList>
}

class HomeWorker: HomeWorkingProtocol {
    let session: URLSession = URLSession.shared
    let imageCache = NSCache<NSNumber, UIImage>()
    
    func getRepoList(page: String) -> Observable<RepositoriesList> {
        guard let url = RepositoriesRequest.bindUrl(page: page) else {
            return Observable.error(NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        }
        
        return Observable.create { [weak self] observer -> Disposable in
            let task = self?.session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                guard let data = data else {
                    observer.onError(NSError(domain: "No data", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(RepositoriesList.self, from: data)
                    observer.onNext(response)
                    observer.onCompleted()
                    
                } catch {
                    observer.onError(error)
                }
            }
            
            task?.resume()
            
            return Disposables.create {
                task?.cancel()
            }
        }
        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        .observe(on: MainScheduler.instance) 
    }
}
