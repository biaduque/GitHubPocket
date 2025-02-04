//
//  RepoDetailViewTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class RepoDetailViewTests: XCTestCase {
    var view: RepoDetailView?
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        view = RepoDetailView(viewModel: RepoDetailViewModel())
        tableView = UITableView()
        tableView.delegate = view
        tableView.dataSource = view
    }
    
    override func tearDown() {
        view = nil
        tableView = nil
        super.tearDown()
    }
    
    func test_numberOfRowsInSection_WhenPullRequestsExist_ShouldReturnCorrectCount() {
        // Given
        guard let view = view else {
            XCTFail()
            return
        }
        
        let pullRequests = [
            RepoDetailList(title: "1", user: User(login: "", avatarUrl: "")),
            RepoDetailList(title: "2", user: User(login: "", avatarUrl: ""))
        ]
        
        view.repoDetailModel = RepoDetailViewModel(pullRequestList: pullRequests)
        
        // When
        let rowCount = view.tableView(tableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(rowCount, 2, "Wrong number of lines")
    }
    
    func test_numberOfRowsInSection_WhenPullRequestsAreNil_ShouldReturnZero() {
        // Given
        guard let view = view else {
            XCTFail()
            return
        }
        
        view.repoDetailModel = RepoDetailViewModel(pullRequestList: [])
        
        // When
        let rowCount = view.tableView(tableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(rowCount, 0, "Wrong number of lines")
    }
    
    func test_cellForRowAt_ShouldReturnConfiguredCell() {
        // Given
        guard let view = view else {
            XCTFail()
            return
        }
        
        let pullRequests = [
            RepoDetailList(title: "1", user: User(login: "", avatarUrl: "")),
            RepoDetailList(title: "2", user: User(login: "", avatarUrl: ""))
        ]
        
        view.repoDetailModel = RepoDetailViewModel(pullRequestList: pullRequests)

        tableView.register(PullRequestViewCell.self, forCellReuseIdentifier: PullRequestViewCell.identifier)
        
        // When
        let cell = view.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? PullRequestViewCell
        
        // Then
        XCTAssertNotNil(cell, "A célula não deveria ser nil")
    }
    
    func test_didSelectRowAt_ShouldCallDelegate() {
        // Given
        guard let view = view else {
            XCTFail()
            return
        }
        
        let mockDelegate = RepoDetailDelegateSpy()
        view.delegate = mockDelegate
        
        let pullRequests = [
            RepoDetailList(title: "1", user: User(login: "", avatarUrl: "")),
            RepoDetailList(title: "2", user: User(login: "", avatarUrl: ""))
        ]
        
        view.repoDetailModel = RepoDetailViewModel(pullRequestList: pullRequests)

        // When
        view.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertTrue(mockDelegate.didSelectPullRequestCalled)
    }
}
