//
//  HomeViewFactory.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class HomeViewFactory: FactoryProtocol {
    static func makeController(with coordinator: GitHubPocketCoordinator) -> UIViewController {
        let viewController = HomeViewController(view: HomeView(viewModel: HomeViewModel()))
        viewController.title = "GitHub Pocket"

        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        interactor.setup(worker: HomeWorker())
        router.setup(coordinator: coordinator)
        
        viewController.setup(router: router)
        viewController.setup(interactor: interactor)
        return viewController
    }
}
