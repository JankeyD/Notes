//
//  NotesViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 15.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

class NotesViewModel: ViewModel {
    /// All dependencies which have to be fulfilled to be able to operate.
    typealias Dependencies = HasNotesService
    
    private let _notesService: NotesServiceType
    
    var needsReloadData: Dynamic<Bool> = Dynamic(false)
    
    var notes: [Note] {
        return NotesStorage.instance.storage
    }
    
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
        state.value = .loading
        
        let _ = _notesService.getNotes { [weak self] response in
            DispatchQueue.main.async(execute: {
                if case .success(let noteResponse) = response {
                    if let notes = noteResponse?.notes {
                        NotesStorage.instance.store(notes)
                        
                        self?.state.value = .valid
                    }
                }
                
                if case .failure(let error) = response {
                    print(error)
                    self?.state.value = .invalid
                }
            })
        }
    }
    
    private func updateNote(_ note: Note) {
        let _ = _notesService.updateNote(note) { [weak self] response in
            DispatchQueue.main.async(execute: {
                if case .success(let note) = response {
                    if let note = note {
                        NotesStorage.instance.update(note)
                        self?.needsReloadData.value = true
                    }
                }
                
                if case .failure(let error) = response {
                    print(error)
                }
            })
        }
    }
    
    private func createNote(_ note: Note) {
        let _ = _notesService.createNote(note) { [weak self] response in
            DispatchQueue.main.async(execute: {
                if case .success(let note) = response {
                    if let note = note {
                        NotesStorage.instance.store(note)
                        self?.needsReloadData.value = true
                    }
                }
                
                if case .failure(let error) = response {
                    print(error)
                }
            })
        }
    }
    
    func deleteNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) {
        let _ = _notesService.deleteNote(note) { response in
            DispatchQueue.main.async(execute: {
                if case .success = response {
                    NotesStorage.instance.delete(note)
                    completion(ServiceResult.success(nil))
                }
                
                if case .failure(let error) = response {
                    print(error)
                }
            })
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
