//
//  TransactionViewModel.swift
//  AirBank
//
//  Created by Roman Lazan on 28.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

class TransactionDetailViewModel: ViewModel {
    /// All dependencies which have to be fulfilled to be able to operate.
    typealias Dependencies = HasTransactionsService
    
    private let _transactionsService: TransactionsServiceType
    
    var transactionItem: TransactionItem?
    
    var transactionDetail: Dynamic<TransactionDetail?> = Dynamic(nil)
    
    
    /// Default initializer which gets passed in all dependencies
    ///
    /// - Parameters:
    ///   - dependencies: The dependencies which are required to be able to operate.
    init(dependencies: Dependencies, transaction: TransactionItem) {
        _transactionsService = dependencies.transactionsService
        transactionItem = transaction
        
        super.init()
        
        getTransactionDetail()
    }
    
    func getTransactionDetail() {
        guard let transactionID = transactionItem?.id else { return }
        
        state.value = .loading
        
        let _ = _transactionsService.getTransactionDetail(withTransactionID: transactionID) { [weak self] response in
            DispatchQueue.main.async(execute: {
                if case .success(let transactionResponse) = response {
                    if let transaction = transactionResponse?.contraAccount {
                        self?.transactionDetail.value = transaction
                        
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
