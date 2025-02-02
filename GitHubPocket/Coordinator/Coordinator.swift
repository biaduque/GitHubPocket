//
//  Coordinator.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit

/// ** Protocolo coordinator**
/// 🇺🇸 Used to app controllers orcherstrate
/// 🇧🇷 Utilizado para orquestração de controllers presentes no app
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func startDetail()
}

class GitHubPocketCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// InitialViewController
    /// **Home*
    func start() {
        let viewController = HomeViewFactory.makeController(with: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func startDetail() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemPink
        navigationController.pushViewController(viewController, animated: true)
    }
}
