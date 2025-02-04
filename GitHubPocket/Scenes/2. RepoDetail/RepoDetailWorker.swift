//
//  RepoDetailWorker.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import RxSwift

/// **HomeWorker**
/// Responsável por realizar o GET da url da lista de reposiórios de acordo com a url passada
protocol RepoDetailWorkingProtocol: AnyObject {
    func getRepoList(with request: RepoDetailRequest) -> Observable<[RepoDetailList]>
}

class RepoDetailWorker: RepoDetailWorkingProtocol {
    var session: URLSession = URLSession.shared
    
    func getRepoList(with request: RepoDetailRequest) -> Observable<[RepoDetailList]> {
        guard let url = RepoDetailRequest.bindUrl(infos: request) else {
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
                    let response = try JSONDecoder().decode([RepoDetailList].self, from: data)
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
