//
//  ImagePicker.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    let selectedImage: (UIImage?) -> Void
    let sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> ImageCoordinator {
        ImageCoordinator(selectedImage: selectedImage)
    }
    
    class ImageCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let selectedImage: (UIImage?) -> Void
        
        init(selectedImage: @escaping (UIImage?) -> Void) {
            self.selectedImage = selectedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            selectedImage(info[.originalImage] as? UIImage)
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            selectedImage(nil)
            picker.dismiss(animated: true)
        }
    }
}
