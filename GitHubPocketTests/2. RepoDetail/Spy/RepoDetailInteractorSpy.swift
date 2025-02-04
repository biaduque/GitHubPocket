//
//  RepoDetailInteractorSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class RepoDetailInteractorSpy: RepoDetailBusinessLogic {
    var fetchPullRequestListCalled = false
    var calledPullRequestDetail = false
    
    func fetchPullRequestList(request: GitHubPocket.RepoDetailRequest) {
        fetchPullRequestListCalled = true
    }
    
    func calledPullRequestDetail(url: String) {
        calledPullRequestDetail = true 
    }
}
