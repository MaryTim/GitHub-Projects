//
//  DefaultProjectRepositoryTests.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import XCTest
@testable import GitHub_Projects

final class DefaultProjectRepositoryTests: XCTestCase {
    
    var sut: DefaultProjectRepository!
    
    override func setUp() {
        sut = DefaultProjectRepository(httpService: MockHTTPService())
    }

    override func tearDown() {
        sut = nil
    }
    
    func testFetchProjectsReturnsValue() async throws {
        let model = try await sut.fetchProjects(from: Date())
        XCTAssertEqual(model, ProjectsResponse.stub, "items didn't match")
    }
    
    func testFetchProjectsThrowsFetchFailure() async throws {
        sut = DefaultProjectRepository(httpService: MockFetchingFailureHTTPService())
        let expectedError = ProjectRepositoryError.fetchFailure
        do {
            _ = try await sut.fetchProjects(from: Date())
            XCTFail("we expected error to be thrown")
        } catch {
            XCTAssertEqual(expectedError, error as? ProjectRepositoryError, "errors are of differnet type")
        }
    }
    
    func testFetchProjectsThrowsDecodeFailure() async {
        sut = DefaultProjectRepository(httpService: MockDecodingFailureHTTPService())
        let expectedFailure = ProjectRepositoryError.decodeFailure
        do {
            _ = try await sut.fetchProjects(from: Date())
            XCTFail("we expected error to be thrown")
        } catch {
            XCTAssertEqual(expectedFailure, error as? ProjectRepositoryError, "errors are of differnet type")
        }
    }
}

