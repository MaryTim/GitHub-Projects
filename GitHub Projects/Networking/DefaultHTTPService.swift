//
//  DefaultHTTPService.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

struct DefaultHTTPService: HTTPService {
    
    let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData<T>(for endpoint: T) async throws -> Data where T: Endpoint {
        let request = try endpoint.makeUrlRequest()
        let (data, _) =  try await urlSession.data(for: request, delegate: nil)
        return data
    }
}
