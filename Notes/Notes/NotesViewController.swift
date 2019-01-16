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
        setupCellTapHandling()
        setupRightBarButtonItem()
    }
    
    //MARK: Rx Setup
    
    private func setupCellConfiguration() {
        guard let viewModel = self.viewModel else { return }

        viewModel.notes.asObservable()
            .bind(to: tableView
                .rx
                .items(cellIdentifier: NoteCell.identifier, cellType: NoteCell.self)) {
                    row, note, cell in
                    cell.configure(withNote: note)
                    
            }
            .disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(Note.self)
            .subscribe(onNext: {
                note in
                self.coordinator?.showNoteDetail(with: note)
                
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func createBarItemTouchUpInside(_ sender: UIBarButtonItem) {
        coordinator?.createNote()
    }
    
    @objc private func editBarButtonItemTouchUpInside() {
        
    }
    
    private func setupRightBarButtonItem() {
        let editItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editBarButtonItemTouchUpInside))
        navigationItem.rightBarButtonItem = editItem
    }
}

