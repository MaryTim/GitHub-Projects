//
//  MockProjectRepository.swift
//  GitHub ProjectsTests
//
//  Created by Maria Budkevich on 06/04/2025.
//

import Foundation
@testable import GitHub_Projects

struct MockProjectRepository: ProjectRepository {
    
    let shouldFail: Bool
    
    func fetchProjects(from date: Date) async throws -> GitHub_Projects.ProjectsResponse {
        if shouldFail {
            throw MockError.mockError
        } else {
            return ProjectsResponse.stub
        }
    }
}
