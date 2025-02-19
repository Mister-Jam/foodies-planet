//
//  Dictionary+Extension.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

extension Dictionary {
    var prettyJSONString: String {
        guard JSONSerialization.isValidJSONObject(self) else {
            return .emptyString
        }
        
        do {
            let data = try JSONSerialization.data(
                withJSONObject: self,
                options: [.prettyPrinted, .withoutEscapingSlashes]
            )
            return String(data: data, encoding: .utf8) ?? .emptyString
        } catch {
            Logger.error("Error serializing JSON: \(error)")
            return .emptyString
        }
    }

}
