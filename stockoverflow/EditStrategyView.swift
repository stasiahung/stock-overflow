//
//  EditStrategyView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/8.
//

import SwiftUI

struct EditStrategyView: View {
    @State var strategyName: String = ""
    
    @Environment(\.dismiss) private var dismiss
    //    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("策略名稱", text: $strategyName)
                    .padding()
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                CategoryCardView(categoryName: "基本面", color: .orange, onClick: {})
                CategoryCardView(categoryName: "技術面", color: .pink, onClick: {})
                CategoryCardView(categoryName: "籌碼面", color: .red, onClick: {})
                Spacer()
            }
            .padding()
            .navigationTitle("新增策略")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    EditStrategyView()
}
