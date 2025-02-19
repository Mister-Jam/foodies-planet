//
//  FoodCategoryView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct FoodCategoryView: View {
    var model: FoodCategory
    
    var body: some View {
        Text(model.title)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(model.isSelected ? .white : .primary)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(model.isSelected ? Color.blue : Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
//    FoodCategoryView(title: "All", isSelected: true)
}
