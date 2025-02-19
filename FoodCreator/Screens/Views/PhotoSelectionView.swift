//
//  PhotoSelectionView.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import SwiftUI
import PhotosUI

struct PhotoSelectionView: View {
    @State private var isShowingCamera = false
    @State private var isShowingPhotoLibrary = false
    @State private var selectedImages: [UIImage] = [] {
        didSet {
            didUpdateSelectedPhotos(selectedImages)
        }
    }
    var didUpdateSelectedPhotos: ([UIImage]) -> Void
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                CardButtonView(
                    imageName: "camera",
                    buttonTitle: "Take photo") {
                        isShowingCamera = true
                    }
                    .disabled(selectedImages.count >= 5)
                    .sheet(isPresented: $isShowingCamera) {
                        ImagePicker(selectedImage: handleNewImage, sourceType: .camera)
                    }
                
                CardButtonView(
                    imageName: "arrow.up.square",
                    buttonTitle: "Upload") {
                        isShowingPhotoLibrary = true
                    }
                    .disabled(selectedImages.count >= 5)
                    .sheet(isPresented: $isShowingPhotoLibrary) {
                        ImagePicker(selectedImage: handleNewImage, sourceType: .photoLibrary)
                    }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            if !selectedImages.isEmpty {
                HStack(spacing: 10) {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        SelectedImageView(image: selectedImages[index]) {
                            selectedImages.remove(at: index)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func handleNewImage(_ image: UIImage?) {
        guard let image = image, selectedImages.count < 5 else { return }
        selectedImages.append(image)
    }
}

#Preview {
//    PhotoSelectionView(didUpdateSelectedPhotos: {_ in})
}
