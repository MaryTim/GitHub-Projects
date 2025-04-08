//
//  MockEndpoint.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation
@testable import GitHub_Projects

struct MockEndpoint: Endpoint {
    var scheme = "https"
    var host = "api.github.com"
    var path = "/search/repositories"
    var queryItems: [String : String?]? = ["key" : "value"]
    var httpMethod: HTTPMethod = .get
    var headerFields: [String : String]? = ["key": "value"]
    var body: Data? = "testString".data(using: .utf8)
}
