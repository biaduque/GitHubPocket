//
//  RepoDetailRouterSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class RepoDetailRouterSpy: RepoDetailRoutingProtocol {
    var routeBackToListCalled = false
    
    func routeBackToList() {
        routeBackToListCalled = true 
    }
}
