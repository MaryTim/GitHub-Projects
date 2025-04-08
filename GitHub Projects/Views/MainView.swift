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
    @State var selectedPeriod: Period = .week
    
    var body: some View {
        Group {
            switch projectsVM.status {
            case .loading:
                Loader()
            case .failure(let message):
                ErrorView(viewModel: projectsVM,
                          message: message,
                          period: selectedPeriod)
            case .success(let projects):
                PickerAndProjectsView(selectedPeriod: $selectedPeriod,
                             darkMode: $darkMode,
                             projectsVM: projectsVM,
                             projects: projects)
            }
        }
        .task {
            let fromDate = selectedPeriod.fromDate
            await projectsVM.fetchProjects(from: fromDate)
        }
    }
}
