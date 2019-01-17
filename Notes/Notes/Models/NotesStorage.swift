//
//  NotesStorage.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import RxCocoa

class NotesStorage {
    static let instance = NotesStorage()
    
    var storage = BehaviorRelay<[Note]>(value: [])
    
    func store(_ notes: [Note]) {
        storage.accept(notes)
    }
    
    func store(_ note: Note) {
        guard note.title?.isEmpty == false else { return }
        
        var currentNotes = storage.value
        
        currentNotes.append(note)
        storage.accept(currentNotes)
    }
    
    func delete(_ note: Note) {
        var currentNotes = storage.value
        currentNotes.remove(note)
        storage.accept(currentNotes)
    }
    
    func update(_ note: Note) {
        // Remove the note if title is empty
        guard note.title?.isEmpty == false else {
            delete(note)
            
            return
        }
        
        var currentNotes = storage.value
        
        if let oldNote = currentNotes.filter({$0.id == note.id}).first, let indexToReplace = currentNotes.index(of: oldNote) {
            // Replaces an updated note
            currentNotes.remove(oldNote)
            currentNotes.insert(note, at: indexToReplace)    
        }
        
        storage.accept(currentNotes)
    }
}
