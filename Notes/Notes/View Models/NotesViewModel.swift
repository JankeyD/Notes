//
//  NotesViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 15.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import RxCocoa
import RxSwift

class NotesViewModel: ViewModel {
    /// All dependencies which have to be fulfilled to be able to operate.
    typealias Dependencies = HasNotesService
    
    /// Used to obtain the latest settings for the plugin.
    private let _notesService: NotesServiceType
    
    /// Default initializer which gets passed in all dependencies
    ///
    /// - Parameters:
    ///   - dependencies: The dependencies which are required to be able to operate.
    init(dependencies: Dependencies) {
        _notesService = dependencies.notesService
        
        super.init()
        
        getNotes()
    }
    
    func getNotes() {
        let _ = _notesService.getNotes { response in
            if case .success(let noteResponse) = response {
                if let notes = noteResponse?.notes {
                    NotesStorage.instance.store(notes)
                }
            }
            
            if case .failure(let error) = response {
                print(error)
            }
        }
    }
    
    private func updateNote(_ note: Note) {
        let _ = _notesService.updateNote(note) { response in
            if case .success(let note) = response {
                if let note = note {
                    NotesStorage.instance.update(note)
                }
            }
            
            if case .failure(let error) = response {
                print(error)
            }
        }
    }
    
    private func createNote(_ note: Note) {
        let _ = _notesService.createNote(note) { response in
            if case .success(let note) = response {
                if let note = note {
                    NotesStorage.instance.store(note)
                }
            }
            
            if case .failure(let error) = response {
                print(error)
            }
        }
    }
    
    func handleNoteUpdate(_ note: Note) {
        // Updates a note
        if let _ = note.id {
            updateNote(note)
            
        // Create a new note
        } else {
            createNote(note)
        }
    }
}
