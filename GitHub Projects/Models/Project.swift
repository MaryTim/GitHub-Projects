//
//  Project.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

struct Project: Codable, Identifiable, Equatable, Hashable {
    
    var id: String { "\(author)/\(name)" }
    let author: String
    let name: String
    let avatar: String
    let url: String
    let description: String
    let language: String?
    let languageColor: String?
    let stars: Int
    let forks: Int
    let currentPeriodStars: Int
    let builtBy: [Author]
}

struct Author: Codable, Identifiable, Equatable, Hashable {
    var id: String { username }
    let username: String
    let href: String
    let avatar: String
}
