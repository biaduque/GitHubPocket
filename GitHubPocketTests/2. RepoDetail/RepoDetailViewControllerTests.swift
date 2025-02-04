//
//  RepoDetailViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//


import XCTest
@testable import GitHubPocket

class RepoDetailViewControllerTests: XCTestCase {
    var controller: RepoDetailViewController?
    var mockInfos = RepoDetailRequest(creatorName: "", repoName: "")
    var presenterSpy: RepoDetailPresenterSpy?
    var delegateSpy: RepoDetailDelegateSpy?
    var routerSpy: RepoDetailRouterSpy?
    var interactorSpy: RepoDetailInteractorSpy?
    
    override func setUp() {
        controller = RepoDetailFactory.makeController(with: GitHubPocketCoordinator(with: UINavigationController()), aditionalInfos: mockInfos) as! RepoDetailViewController?
        presenterSpy = RepoDetailPresenterSpy()
        routerSpy = RepoDetailRouterSpy()
        interactorSpy = RepoDetailInteractorSpy()
        delegateSpy = RepoDetailDelegateSpy()
 
        presenterSpy?.setup(controller: controller!)
        controller?.styleView?.delegate = delegateSpy!
        controller?.setup(router: routerSpy!)
        controller?.setup(interactor: interactorSpy!)
    }
    
    func test_initWithCoder() {
        // Given
        let coder = NSCoder()
        // When
        let controller = RepoDetailViewController(coder: coder)
        let view = RepoDetailView(coder: coder)
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
        presenterSpy.presentPullsList(content: [RepoDetailList(title: "", user: User(login: "", avatarUrl: ""))])
        
        // Then
        XCTAssertTrue(presenterSpy.didCall)
        XCTAssertTrue(presenterSpy.didCallPresentPullsList)
    }
    
    func test_didSelectPullRequest() {
        // Given
        guard let delegateSpy = delegateSpy else {
            XCTFail()
            return
        }
        // When
        controller?.styleView?.delegate?.didSelectPullRequest(url: "")
        
        // Then
        XCTAssertTrue(delegateSpy.didSelectPullRequestCalled)
    }
    
    func test_backToList() {
        // Given
        guard let delegateSpy = delegateSpy else {
            XCTFail()
            return
        }
        // When
        controller?.styleView?.delegate?.backToList()
        
        // Then
        XCTAssertTrue(delegateSpy.backToListCalled)
    }
    
    func test_didSelectRepository() {
        // Given
        guard let routerSpy = routerSpy else {
            XCTFail()
            return
        }
        
        // When
        controller?.backToList()
        
        // Then
        XCTAssertTrue(routerSpy.routeBackToListCalled)
    }
    
    func test_fetchRepoList() {
        // Given
        guard let interactorSpy = interactorSpy else {
            XCTFail()
            return
        }
        
        // When
        controller?.didSelectPullRequest(url: "")
        
        // Then
        XCTAssertTrue(interactorSpy.calledPullRequestDetail)
    }
    
    func test_pullCreatorView() {
        // Given
        let view = PullCreatorView()
        let cell = PullRequestViewCell(style: .default, reuseIdentifier: PullRequestViewCell.identifier)
        
        // When
        view.name.text = "mock_name"
        cell.userView = view
        
        // Then
        XCTAssertEqual(cell.userView.name.text, "mock_name")
    }
}
