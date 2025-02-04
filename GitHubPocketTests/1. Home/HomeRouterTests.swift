//
//  HomeRouterTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomeRouterTests: XCTestCase {
    var router: HomeRouter?
    
    override func setUp() {
        router = HomeRouter()
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
        router?.goToDetail(from: RepoDetailRequest(creatorName: "", repoName: ""))
        XCTAssertTrue(coordinator.didCalledStartDetail)
    }
}

