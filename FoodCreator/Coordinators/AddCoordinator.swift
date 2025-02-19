//
//  AddCoordinator.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//

import UIKit
import SwiftUI

final class AddFoodCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.rootViewController = navigationController
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = AddNewFoodViewModel()
        let viewController = AddNewFoodViewController(viewModel: viewModel)
        navigationController.show(viewController, sender: self)
    }
}
