//
//  ProjectDetailsView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct ProjectDetails: View {
    
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(project.name)
            
            Text(project.description)
            
            HStack(spacing: 8) {
                Circle().fill(Color(hex: project.languageColor ?? "0xFFFFFF"))
                    .frame(width: 15)
                Text(project.language ?? "default")
            }

            HStack(spacing: 8) {
                Image(systemName: "star")
                    .frame(width: 15)
                Text("\(project.stars)")
            }
            
            HStack(spacing: 8) {
                Image(systemName: "star")
                    .frame(width: 15)
                Text("\(project.forks)")
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("Built by:")
                VStack(alignment: .leading) {
                    ForEach(project.builtBy, id: \.id) { author in
                        HStack(spacing: 5) {
                            AsyncImage(url: URL(string: author.avatar)) { image in
                                image.resizable()
                            } placeholder: {
                                Image(systemName: "person.circle")
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                            Text(author.username)
                        }
                    }

                }
            }
        }
    }
}

