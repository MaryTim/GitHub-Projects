//
//  PairView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct PairView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .frame(width: 15, height: 15)
            Text(text)
        }
    }
}
