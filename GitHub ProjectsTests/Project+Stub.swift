//
//  Project+Stub.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation

@testable import GitHub_Projects

extension Project {
    static let stub = [Project(author: "John Doe",
                              name: "name",
                              avatar: "some url",
                              url: "url",
                              description: "this is my amazing project",
                              language: "Swift",
                              languageColor: nil,
                              stars: 122374672369,
                              forks: 123123,
                              currentPeriodStars: 2223423,
                              builtBy: [authorStub])]
    
    static let authorStub = Author(username: "johnDoe",
                                   href: "href",
                                   avatar: "avatar")
}
