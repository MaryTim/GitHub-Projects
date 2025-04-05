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
            VStack(alignment: .leading, spacing: 20) {
                Text(project.name)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text(project.description)
                    .padding(.bottom, 20)
                
                LanguageView(project: project)
                PairView(project: project,
                         imageName: Asset.Image.star)
                PairView(project: project,
                         imageName: Asset.Image.fork)
                
                HStack(alignment: .top, spacing: 8) {
                    Text("Built by:")
                    VStack(alignment: .leading) {
                        ForEach(project.builtBy, id: \.id) { author in
                            HStack(spacing: 5) {
                                AsyncImage(url: URL(string: author.avatar)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image(systemName: Asset.Image.avatarPlaceholder)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(.circle)
                                Text(author.username)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
            .padding(15)
        }
        
    }
}

