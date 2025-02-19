//
//  UIFont+Extension.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//
import UIKit

private enum AppFont: String {
    case bold = "Apple SD Gothic Neo Bold"
    case extraBold = "Apple SD Gothic Neo ExtraBold"
    case light = "Apple SD Gothic Neo Light"
    case medium = "Apple SD Gothic Neo Medium"
    case regular = "Apple SD Gothic Neo Regular"
    case semiBold = "Apple SD Gothic Neo SemiBold"
}

extension UIFont {
    static private func font(
        font: AppFont,
        fortextStyle textStyle: UIFont.TextStyle,
        fontSize: CGFloat? = nil) -> UIFont {
            
            guard let font = UIFont(name: font.rawValue, size: fontSize ?? 13)
            else {
                return UIFont.preferredFont(forTextStyle: textStyle)
            }
            
            let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
            return fontMetrics.scaledFont(for: font)
        }
    
    static let bodyOne = font(font: .regular, fortextStyle: .caption1, fontSize: 13)
    
    static let bodyOneSemiBold = font(font: .semiBold, fortextStyle: .caption1, fontSize: 13)
}
