//
//  RepoDetailPresenterTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class RepoDetailPresenterTests: XCTestCase {
    var presenter: RepoDetailPresenter?
    var controller: RepoDetailViewController?
    var mockInfos = RepoDetailRequest(creatorName: "", repoName: "")

    override func setUp() {
        presenter = RepoDetailPresenter()
        controller = RepoDetailFactory.makeController(with: GitHubPocketCoordinator(with: UINavigationController()), aditionalInfos: mockInfos) as! RepoDetailViewController?

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
        presenter?.presentDetailModal(url: "")
        presenter?.presentEmptyView()
        presenter?.presentError()
        presenter?.presentLoading()
        presenter?.presentPullsList(content: [RepoDetailList(title: "", user: User(login: "", avatarUrl: ""))])
        presenter?.updateView()
        
        XCTAssertNotNil(presenter?.controller)
    }
}
