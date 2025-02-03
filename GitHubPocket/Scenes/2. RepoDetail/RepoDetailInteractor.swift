//
//  RepoDetailInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import RxSwift

protocol RepoDetailBusinessLogic {
    func fetchPullRequestList(request: RepoDetailRequest)
    func calledPullRequestDetail(url: String)
}

class RepoDetailInteractor: RepoDetailBusinessLogic {
    var worker: RepoDetailWorkingProtocol?
    var presenter: RepoDetailPresentationLogic?
    private let disposeBag = DisposeBag()
    
    func setup(worker: RepoDetailWorkingProtocol, presenter: RepoDetailPresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }

    func fetchPullRequestList(request: RepoDetailRequest) {
        worker?.getRepoList(with: request)
            .subscribe(
                onNext: { [weak self] pullListResponse in
                    guard let self = self else { return }
                    
                    if pullListResponse.isEmpty {
                        presenter?.presentEmptyView()
                    }
                    
                    presenter?.presentPullsList(content: pullListResponse)
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    
                    presenter?.presentError()
                },
                onCompleted: {
                    self.presenter?.updateView()
                }
            )
            .disposed(by: disposeBag)
    }
    
    func calledPullRequestDetail(url: String) {
        presenter?.presentDetailModal(url: url)
    }
}
