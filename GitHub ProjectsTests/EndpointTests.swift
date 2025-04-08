//
//  EndpointTests.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import XCTest
@testable import GitHub_Projects

final class EndpointTests: XCTestCase {

    var sut: Endpoint!
    
    override func setUp() {
        sut = MockEndpoint()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testMakeUrlReturnsCorrectUrl() throws {
        let result = try sut.makeUrl()
        let expectedURL = URL(string: "https://api.github.com/search/repositories?key=value")!
        XCTAssertEqual(expectedURL, result)
    }
    
    func testMakeURLRequestReturnsURLRequest() throws {
        let result = try sut.makeUrlRequest()
        XCTAssertEqual(result.httpMethod, "GET")
        XCTAssertEqual(result.url, URL(string: "https://api.github.com/search/repositories?key=value")!)
        XCTAssertEqual(result.httpBody, "testString".data(using: .utf8))
        XCTAssertEqual(result.allHTTPHeaderFields, ["key": "value"])
    }
}
