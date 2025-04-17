//
//  EditStrategyView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/8.
//

import SwiftUI

struct EditStrategyView: View {
    @State var strategyName: String = ""
    @State var showingViewType: CategoryType? = nil
    
    
    @Environment(\.dismiss) private var dismiss
    //    @Environment(\.modelContext) var context
    enum CategoryType: String, CaseIterable {
        case 基本 = "基本面"
        case 技術 = "技術面"
        case 籌碼 = "籌碼面"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("策略名稱", text: $strategyName)
                    .padding()
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding()
                List {
                    ForEach(CategoryType.allCases, id: \.self) { category in
                        
                        NavigationLink {
                            Text(category.rawValue)
                        } label: {
                            Text(category.rawValue)
//                            CategoryCardView(categoryName: category.rawValue,
//                                             color: .orange, onClick: {})
                        }
                    }
                }
                .listStyle(.plain)
            }
            
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
