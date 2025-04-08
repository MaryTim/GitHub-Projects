//
//  ProjectsViewModel.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import Foundation

enum Status {
    case loading
    case failure(String)
    case success([Project])
}

@MainActor
class ProjectsViewModel: ObservableObject {

    @Published var status: Status = .loading
    let repository: ProjectRepository
    
    init(repository: ProjectRepository = DefaultProjectRepository()) {
        self.repository = repository
    }
    
    func fetchProjects(from date: Date) async {
        do {
            self.status = .loading
            let result = try await repository.fetchProjects(from: date)
            self.status = .success(result.items)
        } catch {
            let message = handleError(error)
            self.status = .failure(message)
        }
    }
    
    func handleError(_ error: Error) -> String {
        if let repositoryError = error as? ProjectRepositoryError {
            switch repositoryError {
            case .fetchFailure:
                return "Failed to fetch data. Please try again later"
            case .decodeFailure:
                return "Failed to decode data"
            }
        } else if let httperror = error as? HTTPError {
            switch httperror {
            case .invalidUrl:
                return "Invalid URL"
            }
        } else {
            return "Unknown error occured"
        }
    }
}
