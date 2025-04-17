//
//  CategotyStructs.swift
//  stockoverflow
//
//  Created by Stasia Hung on 2025/4/17.
//

enum CompareType: String, Codable {
    case none
    case greaterThan
    case lessThan
    case greaterAndLessThan
}

struct FundamentalCategory: Codable {
    // 本益比
    var peRatioCompareType: CompareType
    var peRatioMax: Float?
    var peRatioMin: Float?
    
    // 股價淨值比
    var pbRatioCompareType: CompareType
    var pbRatioMax: Float?
    var pbRatioMin: Float?
    
    // 殖利率(%)
    var dividendYieldCompareType: CompareType
    var dividendYieldMax: Float?
    var dividendYieldMin: Float?
    
    // (月)營收月增率(%) – Monthly Revenue MoM (%)
    var monthlyRevenueMoMCompareType: CompareType
    var monthlyRevenueMoMMax: Float?
    var monthlyRevenueMoMMin: Float?
    
    // (月)營收月增率(%) – Monthly Revenue YoY (%)
    var monthlyRevenueYoYCompareType: CompareType
    var monthlyRevenueYoYMax: Float?
    var monthlyRevenueYoYMin: Float?
    
    // (月)累積營收年增率(%) – Cumulative Revenue YoY (%)
    var cumulativeRevenueYoYCompareType: CompareType
    var cumulativeRevenueYoYMax: Float?
    var cumulativeRevenueYoYMin: Float?
}
