//
//  RepoDetailFactory.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

class RepoDetailFactory: FactoryProtocol {
    static func makeController(with coordinator: GitHubPocketCoordinator, aditionalInfos: Any?) -> UIViewController {
        
        guard let detailRequest = aditionalInfos as? RepoDetailRequest else {
            return UIViewController()
        }
        
        let viewController = RepoDetailViewController(view: RepoDetailView(viewModel: RepoDetailViewModel()), detail: detailRequest)
        viewController.title = "\(detailRequest.repoName)"

        let router = RepoDetailRouter()
        let interactor = RepoDetailInteractor()
        
        interactor.setup(worker: RepoDetailWorker())
        router.setup(coordinator: coordinator)
        
        viewController.setup(router: router)
        viewController.setup(interactor: interactor)
        return viewController
    }

}
