//
//  RepoDetailRouter.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class RepoDetailRouterTests: XCTestCase {
    var router: RepoDetailRouter?
    
    override func setUp() {
        router = RepoDetailRouter()
    }
    
    func test_setupCoordinator() {
        // Given
        let coordinator = GitHubPocketCoordinator(with: UINavigationController())
        // When
        router?.setup(coordinator: coordinator)
        // Then
        XCTAssertNotNil(router?.coordinator)
    }
    
    func test_goToDetail() {
        // Given
        let coordinator = CoordinatorSpy()
        // When
        router?.setup(coordinator: coordinator)
        // Then
        router?.routeBackToList()
        XCTAssertTrue(coordinator.didCalledBack)
    }
}

