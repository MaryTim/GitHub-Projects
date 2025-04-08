//
//  TestView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 07/04/2025.
//

import SwiftUI

struct PickerAndProjectsView: View {
    
    @Binding var selectedPeriod: Period
    @Binding var darkMode: Bool
    @ObservedObject var projectsVM: ProjectsViewModel
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    let projects: [Project]
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            VStack {
                Picker("Trending", selection: $selectedPeriod) {
                    Text(Asset.Text.segment1).tag(Period.week)
                    Text(Asset.Text.segment2).tag(Period.month)
                }
                .padding()
                .pickerStyle(.segmented)
                .onChange(of: selectedPeriod, { _, _ in
                    Task {
                        await projectsVM.fetchProjects(from: selectedPeriod.fromDate)
                    }
                })
                
                ProjectsList(darkMode: $darkMode, projects: projects)
                    .navigationTitle(Text(Asset.Text.navigationTitle))
                    .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color(Asset.Color.backgroundColor))
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
            List(projects, id: \.id) { project in
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
