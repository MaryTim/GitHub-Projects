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
    
    func fetchProjects() async throws -> [GitHub_Projects.Project] {
        if shouldFail {
            throw MockError.mockError
        } else {
            return Project.stub
        }
    }
}
