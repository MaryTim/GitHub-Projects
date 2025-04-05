//
//  LanguageView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct LanguageView: View {
    
    let project: Project
    
    var body: some View {
        HStack(spacing: 8) {
            Circle().fill(Color(hex: project.languageColor ?? Asset.Color.defaultColor))
                .frame(width: 15, height: 15)
            Text(project.language ?? Asset.Text.defaultLanguage)
        }
    }
}
