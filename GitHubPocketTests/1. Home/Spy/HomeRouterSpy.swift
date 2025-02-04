//
//  HomeRouterSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomeRouterSpy: HomeRoutingProtocol {
    var calledGoToDetail = false
    
    func goToDetail(from repository: GitHubPocket.RepoDetailRequest) {
        calledGoToDetail = true 
    }
}
