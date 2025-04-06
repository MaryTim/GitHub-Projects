//
//  LightDarkModeButton.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 06/04/2025.
//

import SwiftUI

struct LightDarkModeButton: View {

    @Binding var darkMode: Bool
    
    var body: some View {
        Button(action: {
            self.darkMode.toggle()
        }) {
            Image(systemName: darkMode ? Asset.Image.light : Asset.Image.dark)
        }
        .frame(width: 50, height: 50, alignment: .center)
    }
}
