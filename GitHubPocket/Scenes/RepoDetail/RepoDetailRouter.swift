//
//  RepoDetailRouter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol RepoDetailRoutingProtocol: AnyObject {
    func routeBackToList()
}

class RepoDetailRouter: RepoDetailRoutingProtocol {
    var coordinator: Coordinator?
    
    func setup(coordinator: GitHubPocketCoordinator) {
        self.coordinator = coordinator
    }
    
    func routeBackToList() {
        self.coordinator?.back()
    }
}
