//
//  HomePresenter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol HomePresentationLogic {
    func presentEmptyView()
    func presentError()
    func presentRepoList(content: [RepositoryItem])
    func presentLoading()
    func updateView()
}

class HomePresenter: HomePresentationLogic {
    var controller: HomeViewController?

    func setup(controller: HomeViewController) {
        self.controller = controller
    }
    
    func presentLoading() {
        controller?.setupLoading()
    }
    
    func presentEmptyView() {
        controller?.setupEmpty()
    }
    
    func presentError() {
        controller?.setupError()
    }
    
    func presentRepoList(content: [RepositoryItem]) {
        controller?.setupContent(with: content)
    }
    
    func updateView() {
        controller?.updateView()
    }
}
