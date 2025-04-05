//
//  Project.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

struct Project: Codable, Identifiable {
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

struct Author: Codable, Identifiable {
    var id: String { username }
    let username: String
    let href: String
    let avatar: String
}

//struct Project: Codable {
//    let author: String
//    let rank: Int
//    let username: String
//    let repositoryName: String
//    let url: String
//    let description: String
//    let language: String
//    let languageColor: String
//    let totalStars: Int
//    let forks: Int
//    let StarsSince: Int
//    let since: Int
//    let builtBy: [Author]
//}
//
//struct Author: Codable {
//    let username: String
//    let url: String
//    let avatar: String
//}
