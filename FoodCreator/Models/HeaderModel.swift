//
//  HeaderModel.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

struct HeaderModel {
    var foodCategories: [FoodCategory]
    
    static let getDefaultModel = HeaderModel(foodCategories: FoodCategory.getDummyCategories)
}

struct FoodCategory: Identifiable {
    let id = UUID()
    let title: String
    var isSelected: Bool
    
    static let getDefaultCategory = FoodCategory(title: "All", isSelected: true)
    static let getDummyCategories = [
        FoodCategory(title: "Morning Feast", isSelected: false),
        FoodCategory(title: "Sunrise Meals", isSelected: false),
        FoodCategory(title: "Dawn Delicacies", isSelected: false),
        FoodCategory(title: "Night Time Extraordinaires", isSelected: false),
    ]
    
}
