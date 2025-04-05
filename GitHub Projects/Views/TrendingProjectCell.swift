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
        VStack(alignment: .leading) {
            Text(project.name)
                .padding(.bottom, 10)
            Text(project.description)
            
            HStack {
                HStack(spacing: 8) {
                    Circle().fill(Color(hex: project.languageColor ?? "0xFFFFFF"))
                        .frame(width: 15)
                    Text(project.language ?? "default")
                }
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "star")
                        .frame(width: 15)
                    Text("\(project.stars)")
                }
            }
        }
    }
}
