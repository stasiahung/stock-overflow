//
//  HomeView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/7.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TopNavView(title: "Home")
        }
        Text("HomeView")
        Spacer()
    }
}

#Preview {
    HomeView()
}
