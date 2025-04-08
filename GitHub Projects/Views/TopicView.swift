//
//  TopicView.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 07/04/2025.
//

import SwiftUI

struct TopicsView: View {

    let topics: [String]
    
    var body: some View {
        Text(topics.map { "#\($0)"}.joined(separator: "  "))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
