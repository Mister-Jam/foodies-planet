//
//  HomeViewController.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        bindViewModel()
        viewModel.fetchList()
    }
    
    private func bindViewModel() {
        viewModel.networkDelegate = self
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.keyboardDismissMode = .interactive
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private func setupViews() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: FoodItemView.self))
        let headerView = makeTableHeader()
        tableView.tableHeaderView = headerView
        headerView.layoutIfNeeded()
        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        headerView.frame = CGRect(origin: .zero, size: headerSize)
        tableView.tableHeaderView = headerView
    }
    
    private func makeTableHeader() -> UIView {
        var headerModel = HeaderModel.getDefaultModel
        headerModel.foodCategories[0].isSelected = true
        let hostingController = UIHostingController(rootView: HomeHeaderView(model: headerModel))
        hostingController.view.backgroundColor = .clear
        return hostingController.view
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.foodItemModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FoodItemView.self), for: indexPath)
        let item = viewModel.foodItemModel[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration {
            FoodItemView(model: item)
        }
        .margins(.all, .zero)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: NetworkRequestDelegate {
    func showLoader(status: Bool) {
        showLoadingView(status: status)
    }
    
    func showErrorPopup(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
}
