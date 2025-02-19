//
//  TabBarItem.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//
import UIKit

enum TabBarItem: CaseIterable {
    case home
    case generator
    case add
    case favourite
    case planner
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .generator:
            return "Generator"
        case .add:
            return "Add"
        case .favourite:
            return "Favourite"
        case .planner:
            return "Planner"
        }
    }
    
    var selectedImageResource: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")?.withTintColor(.darkBlue, renderingMode: .alwaysTemplate) ?? .blankImage
        case .generator:
            return UIImage(systemName: "wand.and.stars")?.withTintColor(.darkBlue, renderingMode: .alwaysTemplate) ?? .blankImage
        case .add:
            return UIImage(systemName: "plus.circle.fill")?.withTintColor(.darkBlue, renderingMode: .alwaysTemplate) ?? .blankImage
        case .favourite:
            return UIImage(systemName: "heart.fill")?.withTintColor(.darkBlue, renderingMode: .alwaysTemplate) ?? .blankImage
        case .planner:
            return UIImage(resource: .calendar).withTintColor(.darkBlue, renderingMode: .alwaysTemplate)
        }
    }
    
    var unselectedImageResource: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")?.withTintColor(.defaultGray, renderingMode: .alwaysTemplate) ?? .blankImage
        case .generator:
            return UIImage(systemName: "wand.and.stars")?.withTintColor(.defaultGray, renderingMode: .alwaysTemplate) ?? .blankImage
        case .add:
            return UIImage(systemName: "plus.circle")?.withTintColor(.defaultGray, renderingMode: .alwaysTemplate) ?? .blankImage
        case .favourite:
            return UIImage(systemName: "heart")?.withTintColor(.defaultGray, renderingMode: .alwaysTemplate) ?? .blankImage
        case .planner:
            return UIImage(resource: .calendar).withTintColor(.defaultGray, renderingMode: .alwaysTemplate)
        }
    }
    
    func coordinator() -> Coordinator {
        switch self {
        case .home:
            let coordinator = HomeCoordinator(navigationController: UINavigationController())
            coordinator.start()
            return coordinator
        case .generator:
            let coordinator = GeneratorCoordinator(navigationController: UINavigationController())
            coordinator.start()
            return coordinator
        case .add:
            let coordinator = AddFoodCoordinator(navigationController: UINavigationController())
            coordinator.start()
            return coordinator
        case .favourite:
            let coordinator = FavouriteCoordinator(navigationController: UINavigationController())
            coordinator.start()
            return coordinator
        case .planner:
            let coordinator = PlannerCoordinator(navigationController: UINavigationController())
            coordinator.start()
            return coordinator
        }
    }
}
