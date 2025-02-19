//
//  FoodItemModel.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

struct FoodItemModel {
    let title: String
    let tags: [Tag]
    var url: URL?
    let calorieCount: String
    let foodDescription: String
    
    init(title: String, tags: [Tag], url: URL? = nil, calorieCount: String, foodDescription: String) {
        self.title = title
        self.tags = tags
        self.url = url
        self.calorieCount = calorieCount
        self.foodDescription = foodDescription
    }
    
    init(data: FoodListData) {
        self.title = data.name?.capitalized ?? .emptyString
        self.tags = (data.foodTags ?? []).map { Tag(tagName: $0) }
        self.url = URL(string: data.foodImages?.first?.url ?? .emptyString)
        self.calorieCount = "\(data.calories ?? .zero) \(data.calories == 1 ? "Calorie" : "Calories")"
        self.foodDescription = data.description ?? .emptyString
    }
    
    
    static let defaultModel = FoodItemModel(
        title: "Garlic Butter Shrimp Pasta",
        tags: Tag.defaultTags,
        url: URL(string: "https://www.pixelstalk.net/wp-content/uploads/2016/08/Pictures-HD-Food-Download.jpg"),
        calorieCount: "320 Calories",
        foodDescription: "Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes.")
}

struct Tag: Identifiable {
    var id: UUID = UUID()
    let tagName: String
    
    static let defaultTags = [
        Tag.init(tagName: "healthy"),
        .init(tagName: "vegetarian"),
        .init(tagName: "sweet")
    ]
}

extension URL? {
    mutating func reset() {
        self = nil
    }
}
