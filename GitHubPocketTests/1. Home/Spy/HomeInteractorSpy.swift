//
//  HomeInteractorSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomeInteractorSpy: HomeBusinessLogic {
    var fetchRepoListCalled = false
    
    func fetchRepoList(page: String) {
        fetchRepoListCalled = true
    }
}
