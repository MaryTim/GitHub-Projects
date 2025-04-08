//
//  ProjectsResponse.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 07/04/2025.
//

import Foundation

struct ProjectsResponse: Codable, Equatable {
    let items: [Project]
}
