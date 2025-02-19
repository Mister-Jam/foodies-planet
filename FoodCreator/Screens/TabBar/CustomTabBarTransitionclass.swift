//
//  CustomTabBarTransitionclass.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 18/02/2025.
//
import UIKit

final class CustomTabBarTransitionclass: NSObject, UIViewControllerAnimatedTransitioning {
    
    //MARK: Set up class properties and initialize
    let controllers: [UIViewController]?
    private let duaration: Double = 0.25
    
    init(viewControllers: [UIViewController]?) {
        controllers = viewControllers
    }
    //MARK: Get tab bar controller index
    private func getIndex(of viewController: UIViewController) -> Int? {
        if let controllers = controllers {
            let index = controllers.firstIndex { vc in
                vc == viewController
            }
            return index
        }
        return nil
    }
    
    //MARK: Set up transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(duaration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        ///Unwrap view controllers for transitioning and get index of controllers
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
              let temporaryView = fromVC.view,
              let fromIndex = getIndex(of: fromVC),
              let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
              let toView = toVC.view,
              let toIndex = getIndex(of: toVC)
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        /// Define the frames for the initial and destination viewcontrollers
        
        let frame = transitionContext.initialFrame(for: fromVC)
        var fromVCFrameEnd = frame
        var toVCFrameStart = frame
        temporaryView.alpha = 0.4
        fromVCFrameEnd.origin.x = fromIndex < toIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toVCFrameStart.origin.x = fromIndex < toIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toVCFrameStart
        
        transitionContext.containerView.addSubview(toView)
        
        ///Animate the transition
        UIView.animate(
            withDuration: duaration,
            delay: 0.08,
            animations: {
                
                temporaryView.frame = fromVCFrameEnd
                toView.frame = frame
                
            }, completion: { success in
                temporaryView.alpha = 1
                temporaryView.removeFromSuperview()
                transitionContext.completeTransition(success)
                
            })
    }
    
}
