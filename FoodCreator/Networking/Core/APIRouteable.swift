//
//  APIRouteable.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation
import Alamofire

protocol APIRouteable: URLRequestConvertible, GetParameters {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: NetworkHeaders? { get }
}

extension APIRouteable {
    var baseURL: String { return URLS.baseURL }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        guard let url = try? baseURL.asURL().appendingPathComponent(path) else {
            throw AFError.invalidURL(url: "")
        }
        return URLRequest(url: url)
    }
    
    var urlString: String {
        return baseURL + path
    }
    
    var headers: NetworkHeaders? {
        return nil
    }
}
