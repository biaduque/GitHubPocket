//
//  Untitled.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//
import XCTest
@testable import GitHubPocket

class CoordinatorTests: XCTestCase {
    var coordinator: GitHubPocketCoordinator?
    
    override func setUp() {
        coordinator = GitHubPocketCoordinator(with: UINavigationController())
    }
    
    func test_startDetail() {
        // Given
        guard let coordinator = coordinator else {
            XCTFail()
            return
        }
        // When
        coordinator.startDetail(with: RepoDetailRequest(creatorName: "", repoName: ""))
        
        // Then
        XCTAssertNotNil(coordinator.navigationController)
    }
    
    func test_back() {
        // Given
        guard let coordinator = coordinator else {
            XCTFail()
            return 
        }
        // When
        coordinator.back()
        
        // Then
        XCTAssertNil(coordinator.navigationController.popoverPresentationController)
    }
}

class CoordinatorSpy: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    var didCalledStart = false
    var didCalledStartDetail = false
    var didCalledBack = false
    
    
    func start() {
        didCalledStart = true
    }
    
    func startDetail(with request: GitHubPocket.RepoDetailRequest) {
        didCalledStartDetail = true
    }
    
    func back() {
        didCalledBack = true
    }
}
