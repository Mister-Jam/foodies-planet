//
//  NetworkError.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

///Default network ErrorTypes
public enum NetworkError: Error {
    case noInternet
    case badRequest(message: String)
    case endpointError(String)
    case unauthorized
    case decodingError
    
}

extension NetworkError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .noInternet:
            return ErrorMessages.offlineInternet.rawValue
        case .badRequest(let message):
            return message
        case .endpointError(let string):
            return string
        case .unauthorized:
            return "You are unauthorized. Please login and try again"
        case .decodingError:
            return "Sorry we can't make that happen right now.\nPlease try again later"
        }
    }
}
