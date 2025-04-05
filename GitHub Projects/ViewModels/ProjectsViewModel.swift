//
//  ProjectsViewModel.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

enum Status {
    case loading
    case failure
    case success
}

@MainActor
class ProjectsViewModel: ObservableObject {
    
    @Published var projects: [Project] = []
    @Published var status: Status = .loading
    
    let repository: ProjectRepository
    
    init(repository: ProjectRepository = DefaultProjectRepository()) {
        self.repository = repository
    }
    
    func fetchProjects() async {
        do {
            self.projects = try await repository.fetchProjects()
        } catch {
            self.status = .failure
            handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        if let repositoryError = error as? ProjectRepositoryError {
            switch repositoryError {
            case .fetchFailure:
                print("fetch failure")
            case .decodeFailure:
                print("decode failure")
            }
        } else if let httperror = error as? HTTPError {
            switch httperror {
            case .invalidUrl:
                print("invalid url")
            }
        } else {
            print("something else")
        }
    }
}
