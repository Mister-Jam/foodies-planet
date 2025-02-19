//
//  HomeHeaderView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct HomeHeaderView: View {
    @State private var bellAngle = CGFloat.zero
    @State private var searchText: String = ""
    @State private var model: HeaderModel
    @State private var selectedCategory: Int = .zero
    
    init(model: HeaderModel) {
        self.model = model
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                
                Image("UserAvatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hey there, Lucy!")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primary)
                    
                    Text("Are you excited to create a tasty dish today?")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.secondary)
                }
                
                Spacer()
                Button(action: {
                    ringBell()
                }) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundStyle(Color.gray)
                        .padding(8)
                        .rotationEffect(.degrees(bellAngle), anchor: .top)
                }
            }
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color.gray)
                TextField("Search foods...", text: $searchText)
                    .foregroundStyle(Color.primary)
//                    .onChange(of: $searchText, { oldValue, newValue in
//                        <#code#>
//                    })
                    .onChange(of: searchText) { newValue in
                        //search for item
                    }
            }
            .padding()
            
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(model.foodCategories.indices, id: \.self) { index in
                        let category = model.foodCategories[index]
                        FoodCategoryView(model: category)
                            .onTapGesture {
                                if index != selectedCategory {
                                    model.foodCategories[selectedCategory].isSelected = false
                                    model.foodCategories[index].isSelected = true
                                    selectedCategory = index
                                }
                                
                            }
                        
                    }
                }
            }.padding(.horizontal, 2)
                .padding(.bottom, 10)
            
        }.background(Color.clear)
    }
    
    private func ringBell() {
        bellAngle = -10
        withAnimation(Animation.easeInOut(duration: 0.1).repeatCount(3, autoreverses: true)) {
            bellAngle = 10
        }
        
        let totalDuration = CGFloat.pi * 0.1 * 2
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) {
            bellAngle = 0
        }
    }
}

#Preview {
    HomeHeaderView(model: HeaderModel.getDefaultModel)
}
