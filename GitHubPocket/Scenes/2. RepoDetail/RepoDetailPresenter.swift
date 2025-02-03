//
//  RepoDetailPresenter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol RepoDetailPresentationLogic {
    func presentDetailModal(url: String)
    func presentEmptyView()
    func presentError()
    func presentPullsList(content: [RepoDetailList])
    func presentLoading()
    func updateView()
}

class RepoDetailPresenter: RepoDetailPresentationLogic {
    var controller: RepoDetailViewController?
    
    func setup(controller: RepoDetailViewController) {
        self.controller = controller
    }
    
    func presentDetailModal(url: String) {
        let modalController = PullRequestDetailFactory.makeController(with: url)
        controller?.present(modalController, animated: true)
    }
    
    func presentEmptyView() {
        controller?.setupEmpty()
    }
    
    func presentError() {
        controller?.setupError()
    }
    
    func presentPullsList(content: [RepoDetailList]) {
        controller?.presentPullsList(content: content)
    }
    
    func presentLoading() {
        controller?.setupLoading()
    }
    
    func updateView() {
        controller?.updateView()
    }
    
}
