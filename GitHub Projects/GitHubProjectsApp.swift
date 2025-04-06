//
//  GitHubProjectsApp.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 29/03/2025.
//

import SwiftUI

@main
struct GitHubProjectsApp: App {
    
    @AppStorage("darkModeEnabled") var darkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainView(projectsVM: ProjectsViewModel(), darkMode: $darkMode)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
