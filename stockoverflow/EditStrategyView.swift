//
//  EditStrategyView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/8.
//

import SwiftUI

struct EditStrategyView: View {
    var body: some View {
        VStack {
            CategoryCardView(categoryName: "基本面", color: .red, onClick: {})
            CategoryCardView(categoryName: "技術面", color: .red, onClick: {})
            CategoryCardView(categoryName: "籌碼面", color: .red, onClick: {})
        }
        .padding()
    }
}

#Preview {
    EditStrategyView()
}
