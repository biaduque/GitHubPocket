//
//  HomeViewDelegateSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomeViewDelegateSpy: HomeViewDelegate {
    var didCallSelectRepository = false
    var didCallRequestedNextPage = false
    
    func didSelectRepository(creatorName: String, repoName: String) {
        didCallSelectRepository = true
    }
    
    func didRequestedNextPage() {
        didCallRequestedNextPage = true
    }
}
