//
//  GetContentRoute.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//
import Foundation

struct GetContentRoute: APIRouteable {
    var path: String
    var method: RequestMethod
    var getRequestParameters: NetworkParameter
}
