//
//  CardButtonView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI

struct CardButtonView: View {
    let imageName: String
    let buttonTitle: String
    var didTapButton: () -> Void
    
    var body: some View {
        Button(action: {
            didTapButton()
        }) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .padding(.bottom, 8)
                Text(buttonTitle)
            }
            .tint(Color.black)
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
        }
    }
}

#Preview {
    CardButtonView(imageName: "camera", buttonTitle: "Take photo", didTapButton: {})
}
