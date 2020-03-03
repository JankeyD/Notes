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

enum Direction: String, Decodable {
    case outgoing = "OUTGOING"
    case incoming = "INCOMING"
    
    var description: String {
        switch self {
        case .outgoing:
            return "outgoing"
        case .incoming:
            return "incoming"
        }
    }
}

struct TransactionItem: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case id
        case amountInAccountCurrency
        case direction
    }
    
    var id: Int?
    var amountInAccountCurrency: Int?
    var direction: Direction?
}

