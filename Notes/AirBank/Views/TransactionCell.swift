//
//  TransactionCell.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    static let identifier = "TransactionCell"
    
    func configure(withTransaction transaction: TransactionItem) {
        guard let amount = transaction.amountInAccountCurrency, let direction = transaction.direction else { return }
        textLabel?.text = String(amount) + " Kc"
        detailTextLabel?.text = direction.description
    }
}
