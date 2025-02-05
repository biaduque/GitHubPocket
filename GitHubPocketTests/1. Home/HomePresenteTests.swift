//
//  HomePresenteTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 04/02/25.
//


import XCTest
@testable import GitHubPocket

class HomePresenteTests: XCTestCase {
    var presenter: HomePresenter?
    var controller: HomeViewController?

    override func setUp() {
        presenter = HomePresenter()
        controller = HomeFactory.makeController(with: GitHubPocketCoordinator(with: UINavigationController()),
                                                aditionalInfos: nil) as? HomeViewController

        presenter?.setup(controller: controller!)
    }
    func test_setupController() {
        // Given
        let controller = controller
        // When
        presenter?.setup(controller: controller!)
        // Then
        XCTAssertNotNil(presenter?.controller)
    }
    
    func test_presentFunctions() {
        presenter?.presentEmptyView()
        presenter?.presentError()
        presenter?.presentLoading()
        presenter?.updateView()
        
        XCTAssertNotNil(presenter?.controller)
    }
}
