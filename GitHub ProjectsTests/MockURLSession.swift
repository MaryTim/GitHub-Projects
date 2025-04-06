//
//  MockURLSession.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation
@testable import GitHub_Projects

struct MockURLSession: URLSessionProtocol {
    
    let shouldThrowError: Bool
    
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        if shouldThrowError {
            throw MockError.mockError
        } else {
            return (Data(), URLResponse())
        }
    }
}
