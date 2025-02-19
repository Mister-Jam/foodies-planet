//
//  NetworkParameters.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import Foundation

typealias NetworkParameter = [String: Any]
typealias NetworkHeaders = [String: String]

extension NetworkParameter {
    func addParameter(type: ParameterType, value: Any) -> NetworkParameter {
        var parameterDictionsry = self
        parameterDictionsry[type.rawValue] = value
        return parameterDictionsry
    }
}
