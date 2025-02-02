//
//  RepoDetailInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import RxSwift

protocol RepoDetailBusinessLogic {
    func fetchPullRequestList(_ completion: @escaping ((_ repositoriesList: RepoDetailViewModel)->Void), request: RepoDetailRequest)
}

class RepoDetailInteractor: RepoDetailBusinessLogic {
    var worker: RepoDetailWorkingProtocol?
    private let disposeBag = DisposeBag()
    
    var responseModel: RepoDetailViewModel = RepoDetailViewModel()
    
    func setup(worker: RepoDetailWorkingProtocol) {
        self.worker = worker
    }

    func fetchPullRequestList(_ completion: @escaping ((_ repositoriesList: RepoDetailViewModel)->Void), request: RepoDetailRequest) {
        worker?.getRepoList(with: request)
            .subscribe(
                onNext: { [weak self] pullListResponse in
                    guard let self = self else { return }
                    self.responseModel.pullRequestList = pullListResponse
                    self.responseModel.status = .success
                    
                    if pullListResponse.isEmpty {
                        self.responseModel.status = .empty
                    }
                    
                    completion(self.responseModel)
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.responseModel.status = .error
                    
                    completion(self.responseModel)
                },
                onCompleted: {
                    completion(self.responseModel)
                }
            )
            .disposed(by: disposeBag)
    }
}
