//
//  HomePresenterSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class HomePresenterSpy: HomePresentationLogic {
    var didCall = false
    var controller: HomeViewController?
    var content: [GitHubPocket.RepositoryItem]?
    
    func presentEmptyView() {
        didCall = true
        controller?.setupEmpty()
    }
    
    func presentError() {
        didCall = true
        controller?.setupError()
    }
    
    func presentRepoList(content: [GitHubPocket.RepositoryItem]) {
        didCall = true
        self.content = content
        controller?.setupContent(with: content)
    }
    
    func presentLoading() {
        didCall = true
        controller?.setupLoading()
    }
    
    func updateView() {
        didCall = true
        controller?.updateView()
    }
    
    func setup(controller: HomeViewController) {
        self.controller = controller
    }
}
