//
//  Projects.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 06/04/2025.
//

import SwiftUI

struct Projects: View {
    
    let projects: [Project]
    @Binding var darkMode: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Asset.Color.backgroundColor)
                    .ignoresSafeArea()
                List(projects) { project in
                    NavigationLink {
                        ProjectDetails(project: project)
                    } label: {
                        TrendingProjectCell(project: project)
                    }
                    .listRowBackground(Color(Asset.Color.backgroundColor))
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color(Asset.Color.backgroundColor))
                .navigationBarTitle(Text("GitHub Trending Projects"), displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        LightDarkModeButton(darkMode: $darkMode)
                    }
                }
            }
        }
        .tint(.secondary)
    }
}
