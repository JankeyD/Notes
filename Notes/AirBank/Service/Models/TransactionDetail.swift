//
//  Transaction.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

struct TransactionDetail: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case accountNumber
        case accountName
        case bankCode
    }
    
    let accountNumber: String?
    var accountName: String?
    var bankCode: String?
}
