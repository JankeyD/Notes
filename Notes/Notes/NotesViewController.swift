//
//  ViewController.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NotesViewController: UIViewController, StoryBoarded {
    
    var viewModel: NotesViewModel?
    
    weak var coordinator: AppCoordinator?
    
    @IBOutlet private var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCellConfiguration()
    }
    
    //MARK: Rx Setup
    
    private func setupCellConfiguration() {
        guard let viewModel = self.viewModel else { return }

        viewModel.notes.asObservable()
            .bind(to: tableView
                .rx
                .items(cellIdentifier: "NoteCell", cellType: NoteCell.self)) {
                    row, note, cell in
                    print("ejj")
                    
            }
            .disposed(by: disposeBag)
    }
}

