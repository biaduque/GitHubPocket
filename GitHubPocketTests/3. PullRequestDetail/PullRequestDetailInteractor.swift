//
//  PullRequestDetailInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class PullRequestDetailInteractorTests: XCTestCase {
    var interactor: PullRequestDetailInteractor?
    
    override func setUp() {
        interactor = PullRequestDetailInteractor()
    }
    
    func test_getWebView() {
        // Given
        guard let interactor = interactor else {
            XCTFail()
            return
        }
        // When
        interactor.getWebView({ response in
            // Then
            XCTAssertTrue(true )
        }, url: "https://apple.com.br")
    }
}

