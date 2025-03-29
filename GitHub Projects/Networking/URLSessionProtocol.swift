//
//  URLSessionProtocol.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 29/03/2025.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}
