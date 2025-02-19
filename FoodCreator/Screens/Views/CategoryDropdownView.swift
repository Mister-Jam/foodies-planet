//
//  CategoryDropdownView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct CategoryDropdownView: View {
    @State private var selectedCategoryIndex = 0
    let categories: [String]
    var didSelectCategory: (String) -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Category")
                .fontWeight(.medium)
            
            Menu {
                ForEach(categories.indices, id: \.self) { index in
                    let category = categories[index]
                    Button(category)
                    {
                        selectedCategoryIndex = index
                        didSelectCategory(category)
                    }
                }
            } label: {
                HStack {
                    Text(categories[selectedCategoryIndex])
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            }
        }
        .tint(Color.black)
        .padding(.horizontal)
    }
}

#Preview {
    CategoryDropdownView(categories: [], didSelectCategory: { _ in })
}
