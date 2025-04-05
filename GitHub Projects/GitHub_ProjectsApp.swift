//
//  GitHub_ProjectsApp.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 29/03/2025.
//

import SwiftUI

@main
struct GitHub_ProjectsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(projectsVM: ProjectsViewModel())
        }
    }
}
