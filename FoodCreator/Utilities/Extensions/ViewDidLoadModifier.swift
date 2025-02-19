//
//  ViewDidLoadModifier.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State private var viewDidLoad: Bool = false
    
    private let callback: (()->Void)
    
    init(onCallback callback: @escaping (()->Void) ) {
        self.callback = callback
    }
    
    public func body(content: Content) -> some View {
        
        if !viewDidLoad {
            viewDidLoad = true
            callback()
        }
        
        return content
    }
    
}

extension View {
    
    func measuring(in size: CGSize) -> CGSize {
        return self
            .padding(5)
            .fixedSize()
            .frame(maxWidth: size.width)
            .fixedSize()
            .measureSize()
    }
    
    func measureSize() -> CGSize {
        return sizeThatFits(nil)
    }
    
    func sizeThatFits(_ size: CGSize?) -> CGSize {
        return CGSize(
            width: self.intrinsicContentSize.width,
            height: self.intrinsicContentSize.height
        )
    }
    
    var intrinsicContentSize: CGSize {
        let intrinsicContentSize = UIView().systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize
        )
        return intrinsicContentSize
    }
    
    public func onViewDidLoad(_ callback: @escaping (()->Void) ) -> some View {
        self.modifier(ViewDidLoadModifier(onCallback: callback))
    }
    
}

