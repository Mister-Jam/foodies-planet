//
//  UIViewController+Extensions.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//
import UIKit

public extension UIViewController {
    func addSubview(_ subview: UIView) {
        view.addSubview(subview)
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    var backButton: UIBarButtonItem {
        let backButton = UIButton(frame: CGRect(x: .zero, y: .zero, width: 35, height: 35))
        backButton.setImage(UIImage(resource: .backButton)
            .withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        backButton.addTarget(self, action: #selector(handleBackButtonTapped), for: .touchUpInside)
        let barItem = UIBarButtonItem(customView: backButton)
        return barItem
    }
    
    @objc func handleBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    internal var spinnerView: SpinnerView? {
        return view.subviews.first { $0 is SpinnerView } as? SpinnerView
    }
    
    private func showLoader(message: String = "") {
        
        guard spinnerView == nil else { return }
        let spinnerAnimatedView = SpinnerView()
        view.addSubview(spinnerAnimatedView)
        spinnerAnimatedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnerAnimatedView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerAnimatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            spinnerAnimatedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            spinnerAnimatedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
        ])
        spinnerAnimatedView.startSpinningAnimation(message)
    }
    
    private func hideLoader() {
        guard let loadingView = spinnerView else { return }
        loadingView.removeSpinningAnimation()
        loadingView.removeFromSuperview()
    }
    
    func showLoadingView(status: Bool) {
        status ? showLoader() : hideLoader()
    }
}
