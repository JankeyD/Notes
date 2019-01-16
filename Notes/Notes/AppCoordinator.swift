//
//  AppCoordinator.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = NotesViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = NotesViewModel(dependencies: ServiceDependencyContainer())
        navigationController.pushViewController(vc, animated: false)
    }
    
    func createNote() {
        let vc = NoteViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showNoteDetail(with note: Note) {
        let vc = NoteViewController.instantiate()
        vc.viewModel = NoteViewModel(note: note)
        navigationController.pushViewController(vc, animated: true)
    }
}


