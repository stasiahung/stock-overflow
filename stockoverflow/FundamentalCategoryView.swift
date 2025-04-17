//
//  FundamentalCategoryView.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/17.
//

import SwiftUI

struct FundamentalCategoryView: View {
    @Binding var category: FundamentalCategory
    
    var body: some View {
        Form {
            Section(header: Text("本益比 (P/E Ratio)")) {
                CompareTypeSelector(
                    title: "本益比",
                    compareType: $category.peRatioCompareType,
                    minValue: Binding(
                        get: { category.peRatioMin ?? 0 },
                        set: { category.peRatioMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.peRatioMax ?? 0 },
                        set: { category.peRatioMax = $0 }
                    ),
                    isPercentage: false
                )
            }
            
            Section(header: Text("股價淨值比 (P/B Ratio)")) {
                CompareTypeSelector(
                    title: "股價淨值比",
                    compareType: $category.pbRatioCompareType,
                    minValue: Binding(
                        get: { category.pbRatioMin ?? 0 },
                        set: { category.pbRatioMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.pbRatioMax ?? 0 },
                        set: { category.pbRatioMax = $0 }
                    ),
                    isPercentage: false
                )
            }
            
            Section(header: Text("殖利率 (Dividend Yield)")) {
                CompareTypeSelector(
                    title: "殖利率",
                    compareType: $category.dividendYieldCompareType,
                    minValue: Binding(
                        get: { category.dividendYieldMin ?? 0 },
                        set: { category.dividendYieldMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.dividendYieldMax ?? 0 },
                        set: { category.dividendYieldMax = $0 }
                    ),
                    isPercentage: true
                )
            }
            
            Section(header: Text("月營收月增率 (Monthly Revenue MoM)")) {
                CompareTypeSelector(
                    title: "月營收月增率",
                    compareType: $category.monthlyRevenueMoMCompareType,
                    minValue: Binding(
                        get: { category.monthlyRevenueMoMMin ?? 0 },
                        set: { category.monthlyRevenueMoMMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.monthlyRevenueMoMMax ?? 0 },
                        set: { category.monthlyRevenueMoMMax = $0 }
                    ),
                    isPercentage: true
                )
            }
            
            Section(header: Text("月營收年增率 (Monthly Revenue YoY)")) {
                CompareTypeSelector(
                    title: "月營收年增率",
                    compareType: $category.monthlyRevenueYoYCompareType,
                    minValue: Binding(
                        get: { category.monthlyRevenueYoYMin ?? 0 },
                        set: { category.monthlyRevenueYoYMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.monthlyRevenueYoYMax ?? 0 },
                        set: { category.monthlyRevenueYoYMax = $0 }
                    ),
                    isPercentage: true
                )
            }
            
            Section(header: Text("累積營收年增率 (Cumulative Revenue YoY)")) {
                CompareTypeSelector(
                    title: "累積營收年增率",
                    compareType: $category.cumulativeRevenueYoYCompareType,
                    minValue: Binding(
                        get: { category.cumulativeRevenueYoYMin ?? 0 },
                        set: { category.cumulativeRevenueYoYMin = $0 }
                    ),
                    maxValue: Binding(
                        get: { category.cumulativeRevenueYoYMax ?? 0 },
                        set: { category.cumulativeRevenueYoYMax = $0 }
                    ),
                    isPercentage: true
                )
            }
        }
    }
}

struct CompareTypeSelector: View {
    let title: String
    @Binding var compareType: CompareType
    @Binding var minValue: Float
    @Binding var maxValue: Float
    let isPercentage: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Picker(selection: $compareType, label: Text("\(title) 比較類型")) {
                Text("不設限").tag(CompareType.none)
                Text("大於").tag(CompareType.greaterThan)
                Text("小於").tag(CompareType.lessThan)
                Text("介於").tag(CompareType.greaterAndLessThan)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if compareType != .none {
                HStack(spacing: 10) {
                    if compareType == .greaterThan || compareType == .greaterAndLessThan {
                        HStack {
                            Text("最小值:")
                            TextField("Min", value: $minValue, formatter: valueFormatter)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: minValue) { newValue in
                                    if isPercentage && newValue > 1 {
                                        minValue = 1
                                    } else if isPercentage && newValue < 0 {
                                        minValue = 0
                                    }
                                }
                            if isPercentage {
                                Text("%")
                            }
                        }
                    }
                    
                    if compareType == .lessThan || compareType == .greaterAndLessThan {
                        HStack {
                            Text("最大值:")
                            TextField("Max", value: $maxValue, formatter: valueFormatter)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: maxValue) { newValue in
                                    if isPercentage && newValue > 1 {
                                        maxValue = 1
                                    } else if isPercentage && newValue < 0 {
                                        maxValue = 0
                                    }
                                }
                            if isPercentage {
                                Text("%")
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var valueFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if isPercentage {
            formatter.minimum = 0
            formatter.maximum = 1
            formatter.multiplier = 100 // Display as percentage
        }
        return formatter
    }
}

// Preview for testing
struct FundamentalCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FundamentalCategoryView(category: .constant(FundamentalCategory(
            peRatioCompareType: .none,
            peRatioMax: nil,
            peRatioMin: nil,
            pbRatioCompareType: .greaterThan,
            pbRatioMax: nil,
            pbRatioMin: 1.5,
            dividendYieldCompareType: .greaterAndLessThan,
            dividendYieldMax: 0.08,
            dividendYieldMin: 0.03,
            monthlyRevenueMoMCompareType: .lessThan,
            monthlyRevenueMoMMax: 0.5,
            monthlyRevenueMoMMin: nil,
            monthlyRevenueYoYCompareType: .none,
            monthlyRevenueYoYMax: nil,
            monthlyRevenueYoYMin: nil,
            cumulativeRevenueYoYCompareType: .none,
            cumulativeRevenueYoYMax: nil,
            cumulativeRevenueYoYMin: nil
        )))
        .previewLayout(.sizeThatFits)
    }
}
