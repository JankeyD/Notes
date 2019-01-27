//
//  ListViewController.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit
import Core

class ListViewController: UIViewController, StoryBoarded {
    var viewModel: TransactionsViewModel?
    
    weak var coordinator: AppCoordinator?
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindModel()
    }
    
    private func bindModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.state.bind { [weak self] state in
            if state == .valid {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.transactionList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as? TransactionCell, let transactions = viewModel?.transactionList  {
            cell.configure(withTransaction: transactions[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let transactions = viewModel?.transactionList {
            //coordinator?.showTransactionDetail(with: transactions[indexPath.row])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
