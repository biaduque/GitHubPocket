//
//  HomeRouter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

protocol HomeRoutingProtocol: AnyObject {
    func goToDetail()
}

class HomeRouter: HomeRoutingProtocol {
    var coordinator: Coordinator?
    
    func setup(coordinator: GitHubPocketCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToDetail() {
        coordinator?.startDetail()
    }
}
