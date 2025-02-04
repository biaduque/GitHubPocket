//
//  RepoDetailWorkerTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
import RxSwift
@testable import GitHubPocket

class RepoDetailWorkerTests: XCTestCase {
    var sut: RepoDetailWorker!
    var mockSession: URLSessionMock!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        mockSession = URLSessionMock()
        sut = RepoDetailWorker()
        sut.session = mockSession
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        sut = nil
        mockSession = nil
        disposeBag = nil
        super.tearDown()
    }
    
    func test_getRepoList() {
        // Given
        let jsonString = """
        [
            {
                "id": 1,
                "name": "Repo Test",
                "full_name": "user/repo-test",
                "owner": {
                    "login": "testuser",
                    "avatar_url": "https://example.com/avatar.png"
                },
                "html_url": "https://github.com/testuser/repo-test"
            }
        ]
        """
        mockSession.data = jsonString.data(using: .utf8)
        
        let request = RepoDetailRequest(creatorName: "testuser", repoName: "repo-test")

        // When
        let result = try? sut.getRepoList(with: request)
            .first()
        
        // Then
        XCTAssertNotNil(result)
    }

    func test_getRepoListNoRequest() {
        // Given
        let request = RepoDetailRequest(creatorName: "", repoName: "")
        
        // When
        let result = sut.getRepoList(with: request)
            .materialize()
        
        // Then
        XCTAssertNotNil(result)
    }
}
