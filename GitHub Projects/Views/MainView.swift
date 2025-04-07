//
//  TrendingProjectsView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var projectsVM: ProjectsViewModel
    @Binding var darkMode: Bool
    
    var body: some View {
        Group {
            switch projectsVM.status {
            case .loading:
                Loader()
            case .failure(let message):
                ErrorView(viewModel: projectsVM, message: message)
            case .success(let projects):
                ProjectsView(darkMode: $darkMode, projects: projects)
            }
        }
        .task {
            await projectsVM.fetchProjects()
        }
    }
}
