//
//  StrategiesView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/7.
//

import SwiftUI

struct StrategiesView: View {
    var body: some View {
        VStack {
            TopNavView(title: "Strategies")
            List {
                Text("Strategy 1")
                
                Button("New Strategy",
                       systemImage: "plus.circle.fill",
                       action: {})
            }
        }
    }
}

#Preview {
    StrategiesView()
}
