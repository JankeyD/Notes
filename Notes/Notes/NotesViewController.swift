//
//  ViewController.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, StoryBoarded {
    var viewModel: NotesViewModel?
    
    weak var coordinator: AppCoordinator?
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindModel()
    }
    
    private func bindModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.state.bind { [weak self] state in
            if state == .valid {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.needsReloadData.bind { [weak self] needsRealodData in
            if needsRealodData {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func createBarItemTouchUpInside(_ sender: UIBarButtonItem) {
        coordinator?.createNote()
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.notes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell, let notes = viewModel?.notes  {
            cell.configure(withNote: notes[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension NotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let notes = viewModel?.notes {
            coordinator?.showNoteDetail(with: notes[indexPath.row])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if let notes = viewModel?.notes {
            viewModel?.deleteNote(notes[indexPath.row], completion: { result in
                if case .success = result {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}

