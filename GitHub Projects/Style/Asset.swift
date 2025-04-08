//
//  Asset.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

enum Asset {
    
    enum Image {
        static let avatarPlaceholder = "person.circle"
        static let star = "star"
        static let fork = "tuningfork"
        static let githubLogo = "gitHubLogo"
        static let sadGithubLogo = "sadLogo"
        static let project = "book.closed.fill"
        static let light = "sun.max.fill"
        static let dark = "moon.fill"
    }
    
    enum Text {
        static let defaultLanguage = "No information about the language"
        static let selectionPlaceholder = "Please select a project you want to know more about."
        static let navigationTitle = "Trending Projects"
        static let segment1 = "this week".uppercased()
        static let segment2 = "this month".uppercased()
        static let retryButton = "Try again"
        static let owner = "Owner:"
        static let language = "Language:"
        static let createdAt = "Created at:"
        static let updatedAt = "Updated at:"
    }
    
    enum Color {
        static let defaultColor = "#808080"
        static let backgroundColor = "backgroundColor"
    }
}
