//
//  CategoryCardView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/8.
//

import SwiftUI

struct CategoryCardView: View {
    let categoryName: String
    let color: Color
    let onClick: () -> Void?
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                Text(categoryName)
                    .foregroundStyle(Color.mainBlack)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.mainBlack)
            }
            .padding()
            .background(color.opacity(0.2))
            .cornerRadius(15)
        }
    }
}

#Preview {
    CategoryCardView(categoryName: "基本面", color: .red, onClick: {})
}
