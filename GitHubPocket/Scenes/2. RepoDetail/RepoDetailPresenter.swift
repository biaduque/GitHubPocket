//
//  RepoDetailPresenter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol RepoDetailPresentationLogic {
    func presentDetailModal(url: String)
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
}
