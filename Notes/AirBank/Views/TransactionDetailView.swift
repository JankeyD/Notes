//
//  TransactionDetailView.swift
//  AirBank
//
//  Created by Roman Lazan on 28.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class TransactionDetailView: UIView {
 //   @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var bankCodeLabel: UILabel!
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setup()
//    }
//
//    fileprivate func setup() {
//        Bundle.main.loadNibNamed("TransactionDetailView", owner: nil, options: nil)?[0] as? UIView ?? UIView()
//        addSubview(contentView)
//
//        // Set constraints
//        contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
//    }
}
