//
//  Coordinator.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController { get }
    func start()
    func addChild(_ child: Coordinator)
    func removeChild(_ child: Coordinator)
}

extension Coordinator {
    
    func addChild(_ child: Coordinator) {
        guard child.parentCoordinator == nil, !childCoordinators.contains(where: {$0 === child}) else {
            return
        }
        childCoordinators.append(child)
        child.parentCoordinator = self
    }
    
    func removeChild(_ child: Coordinator) {
        guard child.parentCoordinator === self, childCoordinators.contains(where: {$0 === child}) else {
            return
        }
        childCoordinators.removeAll {$0 === child}
        child.parentCoordinator = nil
    }
}
