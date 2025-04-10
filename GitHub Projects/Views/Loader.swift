//
//  ThreeDots.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 05/04/2025.
//

import SwiftUI

struct Loader: View {
    @State var loading = false
    private let count = 3
    
    var body: some View {
        ZStack {
            Color(Asset.Color.backgroundColor)
                .ignoresSafeArea()
            
            HStack(spacing: 35) {
                ForEach(0..<count, id: \.self) { index in
                    Image(Asset.Image.githubLogo)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                        .scaleEffect(loading ? 2 : 1)
                        .animation(.easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.2),
                                   value: loading)
                }
            }
        }
        .onAppear() {
            self.loading = true
        }
    }
}
