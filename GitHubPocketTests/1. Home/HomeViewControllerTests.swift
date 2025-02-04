//
//  HomeViewControllerTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomeViewControllerTests: XCTestCase {
    var controller: HomeViewController?
    var presenterSpy: HomePresenterSpy?
    var delegateSpy: HomeViewDelegateSpy?
    var routerSpy: HomeRouterSpy?
    var interactorSpy: HomeInteractorSpy?
    
    override func setUp() {
        controller = HomeFactory.makeController(with: GitHubPocketCoordinator(with: UINavigationController()), aditionalInfos: nil) as! HomeViewController?
        presenterSpy = HomePresenterSpy()
        delegateSpy = HomeViewDelegateSpy()
        routerSpy = HomeRouterSpy()
        interactorSpy = HomeInteractorSpy()
        
        controller?.styleView?.delegate = delegateSpy
        controller?.setup(router: routerSpy!)
        controller?.setup(interactor: interactorSpy!)
        presenterSpy?.setup(controller: controller!)
    }
    
    func test_initWithCoder() {
        // Given
        let coder = NSCoder()
        // When
        let controller = HomeViewController(coder: coder)
        let view = HomeView(coder: coder)
        // Then
        XCTAssertNil(controller)
        XCTAssertNil(view)
    }
    
    func test_contentControllerProtocol() {
        // Given
        guard let presenterSpy = presenterSpy else {
            XCTFail()
            return
        }
        
        // When
        presenterSpy.presentEmptyView()
        presenterSpy.presentError()
        presenterSpy.presentLoading()
        presenterSpy.updateView()
        presenterSpy.presentRepoList(content: [RepositoryItem(id: 1,
                                                              name: "mock_name",
                                                              fullname: "",
                                                              owner: Owner(username: "", avatarUrl: ""),
                                                              url: "",
                                                              description: "",
                                                              stars: 1, forks: 1,
                                                              language: "")])
        
        // Then
        XCTAssertTrue(presenterSpy.didCall)
        XCTAssertEqual(presenterSpy.content?[0].name, "mock_name")
        
    }
    
    func test_didCallSelectRepository() {
        // Given
        guard let delegateSpy = delegateSpy else {
            XCTFail()
            return
        }
        // When
        controller?.styleView?.delegate?.didSelectRepository(creatorName: "", repoName: "")
        
        // Then
        XCTAssertTrue(delegateSpy.didCallSelectRepository)
    }
    
    func test_didCallRequestedNextPage() {
        // Given
        guard let delegateSpy = delegateSpy else {
            XCTFail()
            return
        }
        // When
        controller?.styleView?.delegate?.didRequestedNextPage()
        
        // Then
        XCTAssertTrue(delegateSpy.didCallRequestedNextPage)
    }
    
    
    func test_didSelectRepository() {
        // Given
        guard let routerSpy = routerSpy else {
            XCTFail()
            return
        }
        
        // When
        controller?.didSelectRepository(creatorName: "mock_name", repoName: "mock_repo")
        
        // Then
        XCTAssertTrue(routerSpy.calledGoToDetail)
    }
    
    func test_fetchRepoList() {
        // Given
        guard let interactorSpy = interactorSpy else {
            XCTFail()
            return
        }
        
        // When
        controller?.didRequestedNextPage()
        
        // Then
        XCTAssertTrue(interactorSpy.fetchRepoListCalled)
    }
}
