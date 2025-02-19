//
//  AddNewFoodModel.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import UIKit

struct AddNewFoodModel {
    var name: String = ""
    var description: String = ""
    var category: String = "Dawn Delicacies"
    var calories: String = ""
    var tags: [String] = []
    var images: [UIImage] = []
    
    var isFormValid: Bool {
        return !name.isEmpty &&
        !description.isEmpty &&
        !category.isEmpty &&
        !calories.isEmpty &&
        calories.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    static let categories = [
        "Dawn Delicacies",
        "Lunch Favorites",
        "Dinner Specials",
        "Snacks"
    ]
}
