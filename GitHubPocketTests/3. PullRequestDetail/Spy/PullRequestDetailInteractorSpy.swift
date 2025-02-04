//
//  PullRequestDetailInteractorTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class PullRequestDetailInteractorSpy: PullRequestDetailBusinessLogic {
    var getWebViewCalled = false
    
    func getWebView(_ completion: @escaping ((URLRequest?) -> Void), url: String) {
        getWebViewCalled = true
    }
}
