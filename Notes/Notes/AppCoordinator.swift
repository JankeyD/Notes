//
//  AppCoordinator.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit
import Core

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    private var _notesViewModel: NotesViewModel?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = NotesViewController.instantiate()
        vc.coordinator = self
        _notesViewModel = NotesViewModel(dependencies: ServiceDependencyContainer())
        vc.viewModel = _notesViewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func createNote() {
        let newNote = Note(id: nil, title: nil)
        showNoteDetail(with: newNote)
    }
    
    func showNoteDetail(with note: Note) {
        let vc = NoteViewController.instantiate()
        let noteViewModel = NoteViewModel(note: note)
        noteViewModel.coordinatorDelegate = self
        vc.viewModel = noteViewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: NoteViewModelCoordinatorDelegate {
    func updateNote(_ note: Note) {
        _notesViewModel?.handleNoteUpdate(note)
    }
}


