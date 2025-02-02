//
//  HomeRouter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

protocol HomeRoutingProtocol: AnyObject {
    func goToDetail(from repository: RepoDetailRequest)
}

class HomeRouter: HomeRoutingProtocol {
    var coordinator: Coordinator?
    
    func setup(coordinator: GitHubPocketCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToDetail(from repository: RepoDetailRequest) {
        coordinator?.startDetail(with: repository)
    }
}
