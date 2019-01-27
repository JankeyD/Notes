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
    
//    @IBOutlet private var title: UILabel!
//    @IBOutlet private var subTitle: UILabel!
    
    func configure(withTransaction transaction: TransactionItem) {
        textLabel?.text = String(transaction.amountInAccountCurrency ?? 0) + " Kc"
        detailTextLabel?.text = transaction.direction
    }
}
