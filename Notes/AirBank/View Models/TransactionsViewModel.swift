//
//  TransactionsViewModel.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

class TransactionsViewModel: ViewModel {
    /// All dependencies which have to be fulfilled to be able to operate.
    typealias Dependencies = HasTransactionsService
    
    private let _transactionsService: TransactionsServiceType
    
    var transactionList: [TransactionItem]?
    
    /// Default initializer which gets passed in all dependencies
    ///
    /// - Parameters:
    ///   - dependencies: The dependencies which are required to be able to operate.
    init(dependencies: Dependencies) {
        _transactionsService = dependencies.transactionsService
        
        super.init()
        
        getTransactions()
    }
    
    func getTransactions() {
        state.value = .loading
        
        let _ = _transactionsService.getTransactionList { [weak self] response in
            DispatchQueue.main.async(execute: {
                if case .success(let transactionsResponse) = response {
                    if let transactions = transactionsResponse?.items {
                        self?.transactionList = transactions
                        
                        self?.state.value = .valid
                    }
                }
                
                if case .failure(let error) = response {
                    print(error)
                    self?.state.value = .invalid
                }
            })
        }
    }
}
