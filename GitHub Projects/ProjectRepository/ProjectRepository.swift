//
//  Repository.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 04/04/2025.
//

import Foundation

protocol ProjectRepository {
    func fetchProjects(from date: Date) async throws -> ProjectsResponse
}
