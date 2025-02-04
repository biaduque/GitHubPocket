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
        let result = string.formatMarkdown()
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func tes_stringDate() {
        // Given
        let createdAt = "2022-03-06T05:44:09Z"
        
        // When
        let result = createdAt.setupDate()
        
        //Then
        XCTAssertEqual(result, "6 de março de 2022")
    }
}
