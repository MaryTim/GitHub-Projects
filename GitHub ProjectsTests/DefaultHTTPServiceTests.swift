//
//  DefaultHTTPServiceTests.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import XCTest
@testable import GitHub_Projects

final class DefaultHTTPServiceTests: XCTestCase {

    var sut: DefaultHTTPService!
    
    override func setUp() {
        sut = DefaultHTTPService(urlSession: MockURLSession(shouldThrowError: false))
    }

    override func tearDown() {
        sut = nil
    }
    
    func testFetchDataReturnsData() async throws {
        var expectedResult: Data?
        do {
            expectedResult = try await sut.fetchData(for: MockEndpoint())
        } catch {
            XCTFail()
        }
        XCTAssertNotNil(expectedResult)
    }
    
    func testFetchDataThrowsError() async throws {
        sut = DefaultHTTPService(urlSession: MockURLSession(shouldThrowError: true))
        var expectedError: MockError?
        do {
            let _ = try await sut.fetchData(for: MockEndpoint())
        } catch {
            expectedError = error as? MockError
        }
        XCTAssertNotNil(expectedError)
    }
}

