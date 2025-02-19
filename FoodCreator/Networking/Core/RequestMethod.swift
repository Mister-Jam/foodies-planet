//
//  RequestMethod.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation
import Alamofire

public enum RequestMethod {
    case post
    case get
    case patch
    
    func httpMethod() -> HTTPMethod {
        switch self {
        case .post:
            return HTTPMethod.post
        case .get:
            return HTTPMethod.get
        case .patch:
            return HTTPMethod.patch
        }
    }
}
