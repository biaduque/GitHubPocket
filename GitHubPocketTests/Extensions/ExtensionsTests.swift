//
//  +StringTests.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import XCTest
@testable import GitHubPocket

class ExtensionsTests: XCTestCase {
    func test_string() {
        // Given
        let string = "### Teste markdown"
        
        // When
        string.formatMarkdown()
        
        // Then
        XCTAssertNotNil(string)
    }
}
