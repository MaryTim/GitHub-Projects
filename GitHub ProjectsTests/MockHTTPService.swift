//
//  MockHTTPService.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation

@testable import GitHub_Projects

struct MockHTTPService: HTTPService {
    
    func fetchData<T>(for endpoint: T) async throws -> Data where T : Endpoint {
        let mockModel = ProjectsResponse.stub
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(mockModel)
    }
}

struct MockFetchingFailureHTTPService: HTTPService {
    func fetchData<T>(for endpoint: T) async throws -> Data where T : Endpoint {
        throw MockError.mockError
    }
}

struct MockDecodingFailureHTTPService: HTTPService {
    func fetchData<T>(for endpoint: T) async throws -> Data where T : Endpoint {
        return Data()
    }
}
