//
//  PullRequestDetailFactory.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import WebKit
import UIKit

class PullRequestDetailFactory {
    static func makeController(with path: String) -> UIViewController {
        let interactor = PullRequestDetailInteractor()
        let viewController = PullRequestDetailViewController(webView: PullRequestDetailView(),
                                                             url: path)
        
        viewController.setup(interactor: interactor)
        
        return viewController
    }
}
