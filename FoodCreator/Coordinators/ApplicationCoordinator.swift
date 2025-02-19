//
//  ApplicationCoordinator.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//
import UIKit

final class ApplicationCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    let window: UIWindow
    var rootViewController: UIViewController
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, _ window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        self.rootViewController = self.navigationController
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarItems = TabBarItem.allCases
        let viewControllers = tabBarItems.map { updateTabItems(item: $0) }
        tabBarItems.forEach { addChild($0.coordinator()) }
        let tabBarController = AppTabBarController(tabBarControllers: viewControllers)
        navigationController.show(tabBarController, sender: self)
    }
    
    private func startOnboardingCoordinator() {
//        let coordinator = OnboardingCoordinator(navigationController: navigationController)
//        addChild(coordinator)
//        coordinator.start()
    }
    
    private func startTabBarCoordinator() {
//        let coordinator = TabBarCoordinator(
//            navigationController: navigationController)
//        addChild(coordinator)
//        coordinator.start()
    }
    
    @objc private func forceLogoutIfNecessary(_ sender: Notification) {
        startGetStartedCoordinator()
    }
    
    private func startGetStartedCoordinator() {
//        let coordinator = GetStartedCoordinator(navigationController: navigationController)
//        childCoordinators = []
//        addChild(coordinator)
//        coordinator.start()
    }
    
    private func updateTabItems(item: TabBarItem) -> UIViewController {
        let viewController = item.coordinator().rootViewController
        viewController.tabBarItem.image = item.unselectedImageResource.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.title = item.title
        viewController.tabBarItem.selectedImage = item.selectedImageResource.withRenderingMode(.alwaysOriginal)
        return viewController
    }
    
    deinit {
        Logger.info("deinitialized,.........\(self)")
    }
}
