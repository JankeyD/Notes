//
//  NoteViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

protocol NoteViewModelCoordinatorDelegate: class {
    func updateNote(_ note: Note)
}

class NoteViewModel: ViewModel {
    var note: Note
    
    weak var coordinatorDelegate: NoteViewModelCoordinatorDelegate?
    
    init(note: Note) {
        self.note = note
    }
    
    func updateNote(withText text: String?) {
        note.title = text
        
        coordinatorDelegate?.updateNote(note)
    }
}
