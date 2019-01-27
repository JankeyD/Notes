//
//  HasTransactionsService.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

/// Used for dependency containers to make the transactions service available.
protocol HasTransactionsService {
    
    /// Used to store the trasnactions service reference.
    var transactionsService: TransactionsServiceType { get }
}
