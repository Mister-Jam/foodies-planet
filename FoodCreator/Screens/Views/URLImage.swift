//
//  URLImage.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI
import Kingfisher

struct URLImage: View {
    let imageURL: URL?
    let processor = RoundCornerImageProcessor(cornerRadius: 20)
    
    var body: some View {
        KFImage.url(imageURL)
            .placeholder {
                ProgressView()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
            }
            .setProcessor(processor)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onProgress { receivedSize, totalSize in  }
            .onSuccess { result in  }
            .onFailure { error in }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .frame(maxWidth: UIScreen.main.bounds.width - 10)
            .clipped()
    }
}

#Preview {
    URLImage(imageURL: URL(string: "https://www.pixelstalk.net/wp-content/uploads/2016/08/Pictures-HD-Food-Download.jpg"))
}
