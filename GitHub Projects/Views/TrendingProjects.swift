//
//  TrendingProjectsView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct TrendingProjects: View {
    
    @StateObject var projectsVM: ProjectsViewModel
    
    var body: some View {
        NavigationSplitView {
            List(projectsVM.projects) { project in
                NavigationLink {
                    ProjectDetails(project: project)
                } label: {
                    TrendingProjectCell(project: project)
                }
            }
            .navigationTitle("Trending Projects")
        } detail: {
            Text("Select a Project")
        }
        .task {
           await projectsVM.fetchProjects()
        }
    }}
