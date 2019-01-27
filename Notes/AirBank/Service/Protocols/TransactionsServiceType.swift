//
//  TransactionsServiceType.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core
import ProcedureKit

protocol TransactionsServiceType {
    
    @discardableResult func getTransactionList(completion: @escaping (ServiceResult<TransactionsResponse>) -> Void) -> Procedure?
    
   // @discardableResult func getTransactionDetail(_ note: TransactionDetail, completion: @escaping (ServiceResult<TransactionDetail>) -> Void) -> Procedure?
}
