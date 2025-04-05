//
//  TrendingProjectsView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var projectsVM: ProjectsViewModel
    
    var body: some View {
        Group {
            switch projectsVM.status {
            case .loading:
                Loader()
            case .failure:
                EmptyView()
            case .success(let projects):
                Projects(projects: projects)
            }
        }
        .task {
            await projectsVM.fetchProjects()
        }
    }
}

struct Projects: View {
    
    let projects: [Project]
    
    var body: some View {
        NavigationSplitView {
            List(projects) { project in
                NavigationLink {
                    ProjectDetails(project: project)
                } label: {
                    TrendingProjectCell(project: project)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trending GitHub Projects")
        } detail: {
            Text("Select a Project")
        }
        .accentColor(.black)
    }
}
