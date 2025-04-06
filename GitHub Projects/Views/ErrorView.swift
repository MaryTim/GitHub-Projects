//
//  ErrorView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 06/04/2025.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var viewModel: ProjectsViewModel
    let message: String
    
    var body: some View {
        ZStack {
            Color(Asset.Color.backgroundColor)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Image(Asset.Image.sadGithubLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipped()
                Text(message)
                    .multilineTextAlignment(.center)
                Button("Try again") {
                    Task {
                        await viewModel.fetchProjects()
                    }
                }
                .tint(.secondary)
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}
