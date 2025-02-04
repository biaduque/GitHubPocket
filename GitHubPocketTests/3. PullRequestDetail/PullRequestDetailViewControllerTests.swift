//
//  PullRequestDetailViewControllerTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//


import XCTest
@testable import GitHubPocket

class PullRequestDetailViewControllerTests: XCTestCase {
    var controller: PullRequestDetailViewController?
    var interactorSpy: PullRequestDetailInteractorSpy?
    
    override func setUp() {
        controller = PullRequestDetailFactory.makeController(with: "https://www.apple.com") as? PullRequestDetailViewController
        interactorSpy = PullRequestDetailInteractorSpy()
        
        controller?.setup(interactor: interactorSpy!)
    }
    
    func test_initWithCoder() {
        // Given
        let coder = NSCoder()
        // When
        let controller = PullRequestDetailViewController(coder: coder)
        let view = PullRequestDetailView(coder: coder)
        // Then
        XCTAssertNil(controller)
        XCTAssertNil(view)
    }
    
    func test_loadWebView() {
        // Given
        guard let interactorSpy = interactorSpy else {
            XCTFail()
            return
        }
        
        // When
        controller?.loadWebView()
        
        // Then
        XCTAssertTrue(interactorSpy.getWebViewCalled)
    }
    
    func test_webView() {
        // Given
        let error = NSError(domain: "", code: 404, userInfo: [ NSLocalizedDescriptionKey: "Url not found"])
        guard let controller = controller else {
            XCTFail()
            return
        }
        
        // When
        controller.webView(controller.webView.webView, didFinish: .none)
        controller.webView(controller.webView.webView, didFail: .none, withError: error)
        
        // Then
        XCTAssertTrue(controller.webView.loadingView.message.isHidden)
    }
}
