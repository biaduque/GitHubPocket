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
    func startDetail(with request: RepoDetailRequest)
    func back()
}

class GitHubPocketCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// InitialViewController
    /// **Home*
    /// Controller que exibe uma lista de repositórios
    func start() {
        let viewController = HomeFactory.makeController(with: self,
                                                        aditionalInfos: nil)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    ///
    /// **RepoDetailViewController*
    /// Controller que exibe a lista de pull requests dado um repositório selecionado
    func startDetail(with request: RepoDetailRequest) {
        let viewController = RepoDetailFactory.makeController(with: self,
                                                              aditionalInfos: request)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
