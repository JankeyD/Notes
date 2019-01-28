//
//  TransactionsService.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit
import Core

class TransactionsService: Service, TransactionsServiceType {
    private static let queue = ProcedureQueue()
    
    /// Used to store all service relevant endpoints.
    private enum Endpoints: Endpoint {
        case transactionList
        case transactionDetail
    
        
        /// Returns the complete service URL.
    var url: URL {
            switch self {
            case .transactionList, .transactionDetail:
                return URL(appendedWith: "transactions")
            }
        }
    }
    
    func getTransactionList(completion: @escaping (ServiceResult<TransactionsResponse>) -> Void) -> Procedure? {
        return request(Endpoints.transactionList.url, on: TransactionsService.queue, completion: completion)
    }
    
    func getTransactionDetail(withTransactionID id: Int, completion: @escaping (ServiceResult<TransactionDetailResponse>) -> Void) -> Procedure? {
        let url = Endpoints.transactionDetail.url.appendingPathComponent(String(id), isDirectory: false)
        return request(url, on: TransactionsService.queue, completion: completion)
    }
}

