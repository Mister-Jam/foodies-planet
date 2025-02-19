//
//  AddNewFoodView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct AddNewFoodView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var model: AddNewFoodModel = AddNewFoodModel()
    @State private var showingTagAlert = false
    @State private var newTag: String = ""
    @State var categoriesList = [CategoryDropdownData]()
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    PhotoSelectionView(didUpdateSelectedPhotos: { selectedPhotos in
                        model.images = selectedPhotos
                    })
                    
                    NameDescriptionView(name: $model.name, description: $model.description)
                    
                    CategoryDropdownView(
                        categories: AddNewFoodModel.categories) { category in
                            model.category = category
                        }
                    
                    TextFieldView(title: "Calories", keyboardType: .numberPad, text: $model.calories)
                        .padding(.horizontal)
                    
                    // Tags
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tags")
                            .fontWeight(.medium)
                        
                        ZStack(alignment: .topLeading) {
                            if model.tags.isEmpty {
                                Text("Press enter once you've typed a tag.")
                                    .foregroundColor(Color(.systemGray))
                                    .padding()
                            }
                            
                            FlowLayout(
                                mode: .scrollable,
                                items: model.tags,
                                itemSpacing: 8
                            ) { tag in
                                Button(action: {
                                    if let index = model.tags.firstIndex(of: tag) {
                                        model.tags.remove(at: index)
                                    }
                                }) {
                                    HStack(spacing: 4) {
                                        Text(tag)
                                            .font(.subheadline)
                                        Image(systemName: "xmark")
                                            .font(.caption)
                                    }
                                    .padding(.horizontal, 12)
                                    .background(Color(.systemGray5))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                            
                        }
                        .frame(minHeight: 60)
                        .background(Color(.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                        .onTapGesture {
                            showingTagAlert = true
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                }
                .padding(.top)
                .alert("Add Tag", isPresented: $showingTagAlert) {
                    TextField("Enter tag", text: $newTag)
                    Button("Cancel", role: .cancel) { newTag = "" }
                    Button("Add") {
                        if !newTag.isEmpty && !model.tags.contains(newTag) {
                            model.tags.append(newTag)
                            newTag = ""
                        }
                    }
                } message: {
                    Text("Enter a new tag for your food item")
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
            )
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }.padding(.bottom, 10)
        Button(action: {
            // Handle add food action
            if model.isFormValid {
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("Add food")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(model.isFormValid ? Color.blue : Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .disabled(!model.isFormValid)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 30)
    }
}



#Preview {
    AddNewFoodView()
}
