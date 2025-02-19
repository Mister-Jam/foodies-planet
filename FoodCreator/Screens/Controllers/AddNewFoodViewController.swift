//
//  AddNewFoodViewController.swift
//  FoodCreator
//
//  Created by James Nwankwo  on 19/02/2025.
//
import SwiftUI
import UIKit

class AddNewFoodViewController: UIViewController {
    
    private let viewModel: AddNewFoodViewModel
    
    init(viewModel: AddNewFoodViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.networkDelegate = self
        bindViewModel()
        viewModel.fetchCategories()
    }
    
    private func bindViewModel() {
        
    }
    
    private func setupView() {
        title = "Add new food"
        view.backgroundColor = .systemBackground
        let subView = makeSubView()
        view.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    private func makeSubView() -> UIView {
        var headerModel = HeaderModel.getDefaultModel
        headerModel.foodCategories[0].isSelected = true
        let addFoodView = AddNewFoodView()
        let hostingController = UIHostingController(rootView: addFoodView)
        viewModel.reloadData = { [weak self] in
            guard let self else { return }
            addFoodView.categoriesList = viewModel.categoriesData
            print("updated...............")
        }
        hostingController.view.backgroundColor = .clear
        return hostingController.view
    }
}

extension AddNewFoodViewController: NetworkRequestDelegate {
    func showLoader(status: Bool) {
        showLoadingView(status: status)
    }
    
    func showErrorPopup(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}
