//
//  DefaultProjectRepository.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 04/04/2025.
//

import Foundation

struct DefaultProjectRepository: ProjectRepository {
    
    let httpService: HTTPService
    
    init(httpService: HTTPService = DefaultHTTPService()) {
        self.httpService = httpService
    }
    
    func fetchProjects() async throws -> [Project] {
        let data = try await fetchData()
        return try decode(data)
    }
}

extension DefaultProjectRepository {
    private func fetchData() async throws -> Data {
        do {
            return try await httpService.fetchData(for: ProjectEndpoint.project)
        } catch {
            throw ProjectRepositoryError.fetchFailure
        }
    }
    
    private func decode(_ data: Data) throws -> [Project] {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Project].self, from: data)
        } catch {
            throw ProjectRepositoryError.decodeFailure
        }
    }
}
