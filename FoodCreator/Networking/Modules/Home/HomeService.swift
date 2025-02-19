//
//  HomeService.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//

import Foundation

protocol ContentInterface: AnyObject {
    func handleBaseContentProvisionRequests<T: Decodable>(
        route: APIRouteable,
        inProgress: @escaping (Bool) -> Void,
        completion: @escaping (Result<NetworkResult<T>, NetworkError>) -> Void
    )
}

final class FoodListService: ContentInterface {
    
    private let client = NetworkingClient.networkClient
    
    func handleBaseContentProvisionRequests<T>(
        route: APIRouteable,
        inProgress: @escaping (Bool) -> Void,
        completion: @escaping (Result<NetworkResult<T>, NetworkError>) -> Void) where T : Decodable {
            inProgress(true)
            client.perform(
                apiRoute: route,
                returning: NetworkResult<T>.self,
                completion: { response in
                    inProgress(false)
                    switch response {
                    case .success(let result):
                        guard result.status?.lowercased() == "success" else {
                            completion(.failure(.endpointError(result.message ?? ErrorMessages.defaultError.rawValue)))
                            return
                        }
                        completion(.success(result))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
        }
}
