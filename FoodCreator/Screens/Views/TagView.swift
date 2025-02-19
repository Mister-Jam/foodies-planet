//
//  TagView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct TagView: View {
    let tag: String
    
    var body: some View {
        Text(tag)
            .font(.caption)
            .foregroundStyle(Color.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .padding(.vertical, 4)
            .background(Color.tagPink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TagView(tag: "Love")
}
