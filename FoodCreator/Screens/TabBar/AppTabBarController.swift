//
//  AppTabBarController.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import UIKit

final class AppTabBarController: UITabBarController {
    
    private let tabBarControllers: [UIViewController]
    
    init(tabBarControllers: [UIViewController]) {
        self.tabBarControllers = tabBarControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .systemBackground
        setupTabBar()
        setViewControllers(tabBarControllers, animated: true)
        selectedIndex = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTabBar() {
        tabBar.itemWidth = 20
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 120
        tabBar.isTranslucent = false
        tabBar.tintColor = .tabBar
        tabBarItem.titlePositionAdjustment = .init(horizontal: .zero, vertical: 10)
        let selectedFontAttribute = [NSAttributedString.Key.font: UIFont.bodyOneSemiBold, NSAttributedString.Key.foregroundColor: UIColor.darkBlue]
        let fontAttribute = [NSAttributedString.Key.font: UIFont.bodyOne]
        tabBarItem.setTitleTextAttributes(fontAttribute, for: .normal)
        let appearance = tabBar.standardAppearance.copy()
        appearance.backgroundImage = .blankImage
        appearance.shadowColor = .gray.withAlphaComponent(0.5)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = fontAttribute
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedFontAttribute
        tabBar.standardAppearance = appearance
        if let items = tabBar.items {
            for item in items {
                item.setTitleTextAttributes([.foregroundColor: UIColor.tintColor], for: .selected)
                item.setTitleTextAttributes([.foregroundColor: UIColor.defaultGray], for: .normal)
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if let items = tabBar.items {
            for item in items {
                item.selectedImage = item.selectedImage
            }
        }
    }

}

extension AppTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let presentingViewController = tabBarController.selectedViewController else { return false }
        if presentingViewController != viewController {
            if tabBarController.selectedIndex == .zero {
            }
            return true
        }
        return false
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTabBarTransitionclass(viewControllers: tabBarController.viewControllers)
    }
}
