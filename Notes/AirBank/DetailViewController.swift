//
//  DetailViewController.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

class DetailViewController: UIViewController, StoryBoarded {
    var viewModel: TransactionDetailViewModel?
    
    @IBOutlet weak var transactionDetailView: TransactionDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindModel()
        setupUI()
    }
    
    private func bindModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.transactionDetail.bind { [weak self] transactionDetail in
            self?.transactionDetailView.accountNumberLabel.text = transactionDetail?.accountNumber
            self?.transactionDetailView.accountNameLabel.text = transactionDetail?.accountName
            self?.transactionDetailView.bankCodeLabel.text = transactionDetail?.bankCode
        }
    }
    
    private func setupUI() {
        guard let amount = viewModel?.transactionItem?.amountInAccountCurrency, let direction = viewModel?.transactionItem?.direction else { return }
        transactionDetailView.amountLabel.text = String(amount) + " Kc"
        transactionDetailView.directionLabel.text = direction.description
    }
}
