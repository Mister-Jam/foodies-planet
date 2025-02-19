//
//  NetworkResult.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

public struct NetworkResult<T: Decodable>: Decodable {
    
    public var message: String?
    public var status: String?
    public var code: Int?
    public var data: T?
    
    public init(
        message: String? = nil,
        status: String? = nil,
        code: Int? = nil,
        data: T? = nil) {
            self.message = message
            self.status = status
            self.code = code
            self.data = data
        }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try? values.decode(String.self, forKey: CodingKeys.message)
        self.status = try? values.decode(String.self, forKey: CodingKeys.status)
        self.code = try? values.decode(Int.self, forKey: CodingKeys.code)
        
        do {
            self.data = try values.decodeIfPresent(T.self, forKey: CodingKeys.data)
        } catch {
            Logger.error(error.localizedDescription)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case message
        case status
        case data
        case code
    }
}
