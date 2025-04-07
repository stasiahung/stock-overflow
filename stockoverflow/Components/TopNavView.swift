//
//  TopNavView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/7.
//

import SwiftUI

struct TopNavView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.mainBlack)
                .font(.navTitle)
                .padding()
                .frame(height: 60)
            Spacer()
        }
    }
}

#Preview {
    TopNavView(title: "Test")
}
