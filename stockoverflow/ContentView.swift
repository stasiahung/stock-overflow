//
//  ContentView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "chart.line.uptrend.xyaxis") {
                HomeView()
            }

            Tab("Strategies", systemImage: "chart.line.text.clipboard") {
                StrategiesView()
            }
        }
    }
}

#Preview {
    ContentView()
}
