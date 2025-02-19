//
//  HomeCoordinator.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.rootViewController = navigationController
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeViewController()
    }
    
    private func showHomeViewController() {
        let viewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: viewModel)
        navigationController.show(homeViewController, sender: self)
    }
}
