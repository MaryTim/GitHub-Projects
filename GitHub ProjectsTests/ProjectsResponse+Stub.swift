//
//  Project+Stub.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation

@testable import GitHub_Projects

extension ProjectsResponse {
    static let stub = ProjectsResponse(items: [Project(id: 1,
                                                       name: "Project Name",
                                                       fullName: "Full Project Name",
                                                       owner: ownerStub,
                                                       description: "description",
                                                       htmlUrl: "htmlUrl",
                                                       stargazersCount: 1000,
                                                       forksCount: 100,
                                                       language: "Swift",
                                                       topics: ["swift", "ios", "mobile"],
                                                       createdAt: ISO8601DateFormatter().date(from: "2025-04-01T00:00:00Z")!,
                                                       updatedAt: ISO8601DateFormatter().date(from: "2025-04-01T00:00:00Z")!)])
    
    static let ownerStub = Owner(id: 123,
                                 login: "login",
                                 avatarUrl: "avatarUrl",
                                 htmlUrl: "htmlUrl")
}
