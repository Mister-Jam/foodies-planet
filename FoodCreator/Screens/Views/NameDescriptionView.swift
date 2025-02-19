//
//  NameDescriptionView.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//

import SwiftUI

struct NameDescriptionView: View {
    @Binding var name: String
    @Binding var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextFieldView(title: "Name", keyboardType: .default, text: $name)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Description")
                    .fontWeight(.medium)
                
                TextEditor(text: $description)
                    .frame(minHeight: 100)
                    .padding(4)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
            }
        }.padding(.horizontal)
    }
}

struct TextFieldView: View {
    let title: String
    let keyboardType: UIKeyboardType
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .fontWeight(.medium)
            
            TextField("", text: $text)
                .keyboardType(keyboardType)
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
        }
    }
}

#Preview {
    //    NameDescriptionView()
}
