//
//  FoodDetailsViewModel.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 19/02/2025.
//

import Foundation

final class FoodDetailsViewModel {
    weak var networkDelegate: NetworkRequestDelegate?
    private let service: ContentInterface

    init(service: ContentInterface = FoodListService()) {
        self.service = service
    }
    
//    public func fetchList() {
//        service.handleBaseContentProvisionRequests(
//            route: self,
//            inProgress: { [weak self] status in
//                self?.networkDelegate?.showLoader(status: status)
//            },
//            completion: { [weak self] (response: Result<NetworkResult<[FoodListData]>, NetworkError>) in
//                switch response {
//                case .success(let result):
//                    if let data = result.data {
//                        self?.dataSource = data
//                    } else {
//                        self?.networkDelegate?.showErrorPopup(message: result.message ?? ErrorMessages.defaultError.rawValue)
//                    }
//                case .failure(let error):
//                    self?.networkDelegate?.showErrorPopup(message: error.description)
//                }
//            })
//    }
}
