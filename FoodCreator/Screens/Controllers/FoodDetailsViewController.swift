//
//  FoodDetailsViewController.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 19/02/2025.
//

import UIKit

final class FoodDetailsViewController: UIViewController {
    
    private let viewModel: FoodDetailsViewModel
    
    init(viewModel: FoodDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
