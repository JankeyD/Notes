//
//  ServiceDependencyContainer.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

struct ServiceDependencyContainer {}

extension ServiceDependencyContainer: HasTransactionsService {
    
    /// Used to store the transactions service reference.
    var  transactionsService: TransactionsServiceType {
        if let transactionsService: TransactionsServiceType = ServiceLocator.locateService() {
            return transactionsService
        }
        
        let transactionsService = TransactionsService()
        
        ServiceLocator.addService { () -> TransactionsServiceType in
            transactionsService
        }
        
        return transactionsService
    }
}
