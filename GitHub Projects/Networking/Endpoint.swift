//
//  Endpoint.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 29/03/2025.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [String : String?]? { get }
    var httpMethod: HTTPMethod { get }
    var headerFields: [String : String]? { get }
    var body: Data? { get }
}

extension Endpoint {
    func makeUrl() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems?.compactMap { key, value in
            guard let value else { return nil }
            return URLQueryItem(name: key, value: value)
        }
        guard let url = urlComponents.url else {
            throw HTTPError.invalidUrl
        }
        return url
    }
    
    func makeUrlRequest() throws -> URLRequest {
        let url = try makeUrl()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headerFields
        urlRequest.httpBody = body
        return urlRequest
    }
}
