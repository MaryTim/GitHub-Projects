//
//  RepositoryError.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 04/04/2025.
//

import Foundation

enum ProjectRepositoryError: Error {
    case fetchFailure
    case decodeFailure
}
