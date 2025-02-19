//
//  UILabel+Extension.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//
import UIKit

public extension UILabel {
    convenience init(font: UIFont,
                     string: String? = nil,
                     color: UIColor?,
                     alignment: NSTextAlignment? = .left
    ) {
        self.init()
        if let string = string {
            text = string
        }
        if let color = color {
            textColor = color
        }
        if let alignment = alignment {
            textAlignment = alignment
        }
        scalable(font)
    }
    
    func scalable(_ font_: UIFont) {
        font = font_
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
        if #available(iOS 15.0, *) {
            minimumContentSizeCategory = .small
            maximumContentSizeCategory = .accessibilityMedium
        }
    }
}
