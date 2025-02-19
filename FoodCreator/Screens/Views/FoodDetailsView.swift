//
//  FoodDetailsView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 19/02/2025.
//

import SwiftUI

struct FoodDetailsView: View {
    
    @State private var isFavorite: Bool = false
    @State private var notes: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // MARK: - Custom Top Bar
                    HStack {
                        // Dismiss Button
                        Button(action: {
                            // Handle dismiss or pop
                        }) {
                            Image(systemName: "xmark")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        // Heart (Favorite) Button
                        Button(action: {
                            isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.headline)
                                .foregroundColor(isFavorite ? .red : .primary)
                                .padding(.trailing, 16)
                        }
                        
                        // Share Button
                        Button(action: {
                            // Handle share action
                        }) {
                            Image(.noteIcon)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding()
                    
                    // MARK: - Scrollable Content
                    ScrollView(showsIndicators: false) {
                        
                        // Food Image with Pagination Overlay
                        ZStack(alignment: .topTrailing) {
                            // Replace with AsyncImage or KFImage if you have a remote URL
                            Image("garlicButterShrimpPasta") // local asset placeholder
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .cornerRadius(12)
                                .padding(.horizontal)
                            
                            // Pagination "1/10"
                            Text("1/10")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(8)
                                .padding(.trailing, 24)
                                .padding(.top, 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            // Title
                            Text("Garlic Butter Shrimp Pasta")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            // Tags
                            HStack(spacing: 8) {
                                TagView(tag: "healthy")
                                TagView(tag: "vegetarian")
                            }
                            
                            // Description
                            Text("""
Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes, creating a delightful blend of textures and flavors. The smoothness of the hummus complements the crunchiness of the cucumbers, while the radishes add a peppery bite that elevates the dish. To enhance this already delicious combination, consider adding a sprinkle of paprika for a touch of warmth, or a drizzle of olive oil to enrich the flavors further. You could also incorporate some fresh herbs, like dill or parsley, for a burst of freshness.
""")
                            .font(.body)
                            .foregroundColor(.secondary)
                            
                            // Nutrition
                            HStack(spacing: 8) {
                                Text("Nutrition")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.red)
                                Text("320 Calories")
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                            }
                            
                            // Notes
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Notes")
                                    .font(.headline)
                                if notes.isEmpty {
                                    Button(action: {
                                        // Focus the notes, or navigate to a notes screen
                                    }) {
                                        Text("Add notes")
                                            .foregroundColor(.blue)
                                            .underline()
                                    }
                                } else {
                                    TextEditor(text: $notes)
                                        .frame(minHeight: 100)
                                        .padding(4)
                                        .overlay(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                }
                            }
                            
                            // Remove from Collection Button
                            Button(action: {
                                // Handle remove from collection
                            }) {
                                Text("Remove from collection")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            }
                            .padding(.top, 16)
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 24)
                    }
                }
            }
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    FoodDetailsView()
}
