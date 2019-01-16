//
//  NoteCell.swift
//  Notes
//
//  Created by Roman Lazan on 15.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    static let identifier = "NoteCell"
    
    @IBOutlet private var title: UILabel!
    @IBOutlet private var subTitle: UILabel!
    
    func configure(withNote note: Note) {
        title.text = note.title
        subTitle.text = note.title
    }
}
