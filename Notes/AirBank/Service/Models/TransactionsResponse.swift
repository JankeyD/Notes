//
//  TransactionsResponse.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

struct TransactionsResponse: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    let items: [TransactionItem]?
}

enum Direction: String {
    case outgoing = "OUTGOING"
    case incoming = "INCOMING"
}

struct TransactionItem: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case id
        case amountInAccountCurrency
        case direction
    }
    
    var id: Int?
    var amountInAccountCurrency: Int?
    var direction: String?
}

