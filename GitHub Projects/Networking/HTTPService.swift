//
//  HTTPService.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 29/03/2025.
//

import Foundation

public protocol HTTPService {
    func fetchData<T: Endpoint>(for endpoint: T) async throws -> Data
}

struct DefaultHTTPService: HTTPService {
    
    let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T>(for endpoint: T) async throws -> Data where T : Endpoint {
        let request = endpoint.makeUrlRequest()
        let (data, _) =  try await urlSession.data(for: request, delegate: nil)
        return data
    }
}
