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
