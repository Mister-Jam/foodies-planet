//
//  FoodListData.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//

import Foundation

struct FoodListData: Decodable {
    let id: Int
    var name: String?
    var description: String?
    var categoryId: Int?
    var calories: Int?
    var createdAt: String?
    var updatedAt: String?
    var foodTags: [String]?
    var foodImages: [FoodImage]?
    var category: FoodCategoryData?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case categoryId = "category_id"
        case calories
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case foodTags
        case foodImages
        case category
    }
}


struct FoodImage: Decodable {
    let id: Int
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url = "image_url"
    }
}

struct FoodCategoryData: Decodable {
    let id: Int
    var name: String?
    var description: String?
    var createdAt: String?
    var updatedAt: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

extension FoodCategoryData {
    func mapToDropdown() -> CategoryDropdownData {
        return CategoryDropdownData(id: id, name: name ?? "")
    }
}

struct CategoryDropdownData {
    let id: Int
    let name: String
}
