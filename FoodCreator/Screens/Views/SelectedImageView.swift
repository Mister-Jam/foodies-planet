//
//  SelectedImageView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct SelectedImageView: View {
    let image: UIImage
    var didSelectImage: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button(action: {
                didSelectImage()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
                    .background(Circle().fill(Color.black.opacity(0.5)))
                    .frame(width: 15, height: 15)
            }
            .padding(4)
        }
    }
}

#Preview {
    SelectedImageView(image: .default, didSelectImage: { })
}
