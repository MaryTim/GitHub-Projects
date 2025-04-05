//
//  ProjectEndpoint.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 04/04/2025.
//

import Foundation

enum ProjectEndpoint: Endpoint {
    
    case project
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "github-trending-api.de.a9sapp.eu"
    }
    
    var path: String {
        switch self {
        case .project:
            return "/"
        }
    }
    
    var queryItems: [String : String?]? {
        switch self {
        case .project:
            nil
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .project:
            return .get
        }
    }
    
    var headerFields: [String : String]? {
        switch self {
        case .project:
            return [:]
        }
    }
    
    var body: Data? {
        switch self {
        case .project:
            nil
        }
    }
}
