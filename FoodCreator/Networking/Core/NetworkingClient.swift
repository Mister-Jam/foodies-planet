//
//  NetworkingClient.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation
import Alamofire

enum NetworkingClient {
    static var networkClient: NetworkClient {
        return NetworkClient()
    }
}

final class NetworkClient {
    
    private var reachabilityManager: NetworkReachabilityManager?
    
    init(reachabilityManager: NetworkReachabilityManager? = NetworkReachabilityManager.default) {
        self.reachabilityManager = reachabilityManager
    }
    
    func perform<T: Decodable>(
        apiRoute: APIRouteable,
        returning objectType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void) {
            
            guard reachabilityManager?.isReachable ?? false else {
                completion(.failure(.noInternet))
                return
            }
            
            //set headers
            var headers = HTTPHeaders()
            headers.update(name: "Content_Type", value: "application/json")
            headers.update(name: "Accept", value: "application/json")
            if let requestHeaders = apiRoute.headers {
                requestHeaders.forEach {
                    headers.update(name: $0.key, value: $0.value)
                }
            }
            let encoding: ParameterEncoding
            switch apiRoute.method {
            case .post:
                encoding = JSONEncoding.default
            case .get:
                encoding = JSONEncoding.default
            case .patch:
                encoding = JSONEncoding.default
            }
            debugPrint(apiRoute.getRequestParameters.prettyJSONString, "here.......", apiRoute.urlString)
            
            let parameters = apiRoute.getRequestParameters.isEmpty ? nil : apiRoute.getRequestParameters
            networkSession
                .request(apiRoute.urlString,
                         method: apiRoute.method.httpMethod(),
                         parameters: parameters,
                         encoding: encoding,
                         headers: headers,
                         interceptor: nil)
            //                .validate(statusCode: 200..<300)
                .responseData { response in
                    
                    switch response.result {
                    case .success(let result):
                        do {
                            let responseString = (String(data: result, encoding: .utf8) ?? "")
                            Logger.default(responseString)
                            let decodedData = try JSONDecoder().decode(objectType.self, from: result)
                            completion(.success(decodedData))
                        } catch {
                            Logger.fault(error.localizedDescription)
                            completion(.failure(.decodingError))
                        }
                    case .failure(let error):
                        Logger.error("error.localizedDescription \(error.localizedDescription)")
                        if error.localizedDescription.lowercased().contains("serialized") || error.localizedDescription.lowercased().contains("decoded") {
                            completion(.failure(.decodingError))
                        } else {
                            completion(.failure(.badRequest(message: error.localizedDescription)))
                        }
                    }
                }
            
            
        }
    
    private lazy var networkSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        return Session(
            configuration: configuration,
            delegate: SessionDelegate()
        )
    }()
    
}
