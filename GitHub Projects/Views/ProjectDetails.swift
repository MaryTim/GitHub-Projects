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
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                Text(project.name)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                if let description = project.description, !description.isEmpty {
                    Text(description)
                }
                
                Text("\(Asset.Text.language) \(project.language ?? Asset.Text.defaultLanguage)")
                
                PairView(text: String(project.stargazersCount),
                         imageName: Asset.Image.star)
                
                PairView(text: String(project.forksCount),
                         imageName: Asset.Image.fork)
                
                Text("\(Asset.Text.createdAt) \(project.createdAtFormatted)")
                
                Text("\(Asset.Text.updatedAt) \(project.updatedAtFormatted)")
                
                HStack(alignment: .center, spacing: 15) {
                    Text(Asset.Text.owner)
                    
                    HStack(spacing: 10) {
                        AsyncImage(url: URL(string: project.owner.avatarUrl)) { image in
                            image.resizable()
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            Image(systemName: Asset.Image.avatarPlaceholder)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .clipShape(.circle)
                        
                        if let ownerUrl = URL(string: project.owner.htmlUrl) {
                            Link(destination: ownerUrl) {
                                Text(project.owner.login)
                            }
                        }
                    }
                }

                if let projectUrl = URL(string: project.htmlUrl) {
                    Link(destination: projectUrl) {
                        Text("\(projectUrl)")
                    }
                }
                
                if let topics = project.topics, !topics.isEmpty {
                    TopicsView(topics: topics)
                }
            }
            .padding()
        }
        .background(Color(Asset.Color.backgroundColor))
    }
}
