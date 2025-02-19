//
//  FoodItemView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct FoodItemView: View {
    let model: FoodItemModel
    @State private var isFavorited = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack {
                ZStack(alignment: .topTrailing) {
                    URLImage(imageURL: model.url)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text(model.title)
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                    Button(action: {
                        isFavorited.toggle()
                    }) {
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .foregroundColor(isFavorited ? .red : .gray)
                    }
                }
                
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.red)
                    Text(model.calorieCount)
                        .font(.subheadline)
                        .foregroundStyle(Color.red)
                }
                
                Text(model.foodDescription)
                    .font(.subheadline)
                    .foregroundStyle(Color.black)
            
                
                TagLayoutView(tags: model.tags)
            }
            .padding()
        }
        
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 5)
        .padding(.vertical, 10)
    }
}

#Preview {
    FoodItemView(model: FoodItemModel.defaultModel)
}
