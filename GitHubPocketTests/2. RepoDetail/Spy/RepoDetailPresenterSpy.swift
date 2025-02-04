//
//  RepoDetailPresenterSpy.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//


import XCTest
@testable import GitHubPocket

class RepoDetailPresenterSpy: RepoDetailPresentationLogic {
    var didCall = false
    var didCallPresentPullsList = false
    var detailModal = ""
    var controller: RepoDetailViewController?
   
    func setup(controller: RepoDetailViewController) {
        self.controller = controller
    }
    
    func presentEmptyView() {
        didCall = true
        controller?.setupEmpty()
    }
    
    func presentError() {
        didCall = true
        controller?.setupError()
    }
    
    func presentLoading() {
        didCall = true
        controller?.setupLoading()
    }
    
    func updateView() {
        didCall = true
        controller?.updateView()
    }
    
    func presentDetailModal(url: String) {
        detailModal = ""
    }
    
    func presentPullsList(content: [GitHubPocket.RepoDetailList]) {
        didCallPresentPullsList = true
    }
}
