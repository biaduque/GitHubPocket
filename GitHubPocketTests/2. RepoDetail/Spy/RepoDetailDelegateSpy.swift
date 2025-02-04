//
//  RepoDetailDelegateSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//


import XCTest
@testable import GitHubPocket

class RepoDetailDelegateSpy: RepoDetailViewDelegate {
    var didSelectPullRequestCalled = false
    var backToListCalled = false
    
    func didSelectPullRequest(url: String) {
        didSelectPullRequestCalled = true
    }
    
    func backToList() {
        backToListCalled = true 
    }
}
