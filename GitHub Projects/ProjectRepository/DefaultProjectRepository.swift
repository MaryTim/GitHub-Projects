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
    
    func fetchProjects(from date: Date) async throws -> ProjectsResponse {
        let data = try await fetchData(from: date)
        return try decode(data)
    }
}

extension DefaultProjectRepository {
    private func fetchData(from date: Date) async throws -> Data {
        do {
            return try await httpService.fetchData(for: ProjectEndpoint.project(from: date))
        } catch {
            throw ProjectRepositoryError.fetchFailure
        }
    }
    
    private func decode(_ data: Data) throws -> ProjectsResponse {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(ProjectsResponse.self, from: data)
        } catch {
            throw ProjectRepositoryError.decodeFailure
        }
    }
}
