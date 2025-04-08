//
//  TrendingProjectCell.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct TrendingProjectCell: View {
    
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 8) {
                Image(systemName: Asset.Image.project)
                    .resizable()
                    .frame(width: 18, height: 18)
                Text(project.name)
                    .font(.headline)
            }
            
            if let description = project.description, !description.isEmpty {
                Text(description)
            }
            
            HStack {
                Text(project.language ?? Asset.Text.defaultLanguage)
                Spacer()
                PairView(text: String(project.stargazersCount),
                         imageName: Asset.Image.star)
            }
        }
        .padding(.vertical, 10)
    }
}
