//
//  TestView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 07/04/2025.
//

import SwiftUI

struct ProjectsView: View {
    
    @Binding var darkMode: Bool
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    let projects: [Project]
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ProjectsList(darkMode: $darkMode, projects: projects)
            .navigationTitle(Text(Asset.Text.navigationTitle))
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text(Asset.Text.selectionPlaceholder)
                .multilineTextAlignment(.center)
        }
        .navigationSplitViewStyle(.balanced)
        .tint(.secondary)
    }
}

struct ProjectsList: View {
    
    @Binding var darkMode: Bool
    let projects: [Project]
    
    var body: some View {
        ZStack {
            Color(Asset.Color.backgroundColor)
                .ignoresSafeArea()
            List(projects) { project in
                NavigationLink {
                    ProjectDetails(project: project)
                } label: {
                    TrendingProjectCell(project: project)
                        .foregroundColor(.primary)
                }
                .listRowBackground(Color(Asset.Color.backgroundColor))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(Asset.Color.backgroundColor))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    LightDarkModeButton(darkMode: $darkMode)
                }
            }
        }
    }
}
