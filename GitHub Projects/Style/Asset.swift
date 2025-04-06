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
        static let defaultLanguage = "No information about language"
    }
    
    enum Color {
        static let defaultColor = "#808080"
        static let backgroundColor = "backgroundColor"
    }
}
