//
//  Project+Extensions.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 08/04/2025.
//

import Foundation

extension Project {
    var createdAtFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: createdAt)
    }
    
    var updatedAtFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: updatedAt)
    }
}
