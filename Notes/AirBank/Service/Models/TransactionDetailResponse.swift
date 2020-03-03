//
//  TransactionDetailResponse.swift
//  AirBank
//
//  Created by Roman Lazan on 28.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

struct TransactionDetailResponse: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case contraAccount
    }
    
    let contraAccount: TransactionDetail?
}
