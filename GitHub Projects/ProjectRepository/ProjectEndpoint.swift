//
//  ProjectEndpoint.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 04/04/2025.
//

import Foundation

enum ProjectEndpoint: Endpoint {
    
    case project(from: Date)
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.github.com"
    }
    
    var path: String {
        switch self {
        case .project:
            return "/search/repositories"
        }
    }
    
    var queryItems: [String : String?]? {
        switch self {
        case .project(let date):
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            formatter.dateFormat = "yyyy-MM-dd"
            return ["q" : "created:>\(formatter.string(from: date))",
                    "sort" : "stars",
                    "order": "desc"]
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
