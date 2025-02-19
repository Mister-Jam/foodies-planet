//
//  AddNewFoodViewModel.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//

import Foundation

final class AddNewFoodViewModel {
    weak var networkDelegate: NetworkRequestDelegate?
    private var categories: [FoodCategoryData] = [] {
        didSet {
            categoriesData = categories.map { $0.mapToDropdown()}
        }
    }
    var categoriesData: [CategoryDropdownData] = [] {
        didSet {
            reloadData?()
        }
    }
    private let service: ContentInterface
    var reloadData: (() -> Void)?
    
    
    init(service: ContentInterface = FoodListService()) {
        self.service = service
    }
    
    private var makeCategoriesRoute: APIRouteable {
        GetContentRoute(
            path: "api/categories",
            method: .get,
            getRequestParameters: NetworkParameter())
    }
    
    public func fetchCategories() {
        service.handleBaseContentProvisionRequests(
            route: makeCategoriesRoute,
            inProgress: { [weak self] status in
                self?.networkDelegate?.showLoader(status: status)
            },
            completion: { [weak self] (response: Result<NetworkResult<[FoodCategoryData]>, NetworkError>) in
                switch response {
                case .success(let result):
                    if let data = result.data {
                        self?.categories = data
                    } else {
                        self?.networkDelegate?.showErrorPopup(message: result.message ?? ErrorMessages.defaultError.rawValue)
                    }
                case .failure(let error):
                    self?.networkDelegate?.showErrorPopup(message: error.description)
                }
            })
    }
}
