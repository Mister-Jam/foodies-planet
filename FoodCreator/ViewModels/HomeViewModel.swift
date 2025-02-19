//
//  HomeViewModel.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//

import Foundation

final class HomeViewModel {
    weak var networkDelegate: NetworkRequestDelegate?
    private var dataSource: [FoodListData] = [] {
        didSet {
            foodItemModel = dataSource.map { FoodItemModel(data: $0) }
        }
    }
    private let service: ContentInterface
    var reloadData: (() -> Void)?
    var foodItemModel: [FoodItemModel] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init(service: ContentInterface = FoodListService()) {
        self.service = service
    }
    
    
    public func fetchList() {
        service.handleBaseContentProvisionRequests(
            route: self,
            inProgress: { [weak self] status in
                self?.networkDelegate?.showLoader(status: status)
            },
            completion: { [weak self] (response: Result<NetworkResult<[FoodListData]>, NetworkError>) in
                switch response {
                case .success(let result):
                    if let data = result.data {
                        self?.dataSource = data
                    } else {
                        self?.networkDelegate?.showErrorPopup(message: result.message ?? ErrorMessages.defaultError.rawValue)
                    }
                case .failure(let error):
                    self?.networkDelegate?.showErrorPopup(message: error.description)
                }
            })
    }
}

extension HomeViewModel: APIRouteable {
    var path: String {
        "api/foods/"
    }
    
    var method: RequestMethod {
        .get
    }
    
    var getRequestParameters: NetworkParameter {
        NetworkParameter()
    }
    
    
}
