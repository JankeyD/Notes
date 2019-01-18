//
//  NotesStorage.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//


class NotesStorage {
    static let instance = NotesStorage()
    
    var storage: [Note] = []
    
    func store(_ notes: [Note]) {
        storage = notes
    }
    
    func store(_ note: Note) {
        guard note.title?.isEmpty == false else { return }
        
        var currentNotes = storage
        
        currentNotes.append(note)
        storage = currentNotes
    }
    
    func delete(_ note: Note) {
        var currentNotes = storage
        currentNotes.remove(note)
        storage = currentNotes
    }
    
    func deleteNote(at index: Int) {
        var currentNotes = storage
        currentNotes.remove(at: index)
        storage = currentNotes
    }
    
    func update(_ note: Note) {
        // Remove the note if title is empty
        guard note.title?.isEmpty == false else {
            delete(note)
            
            return
        }
        
        var currentNotes = storage
        
        if let oldNote = currentNotes.filter({$0.id == note.id}).first, let indexToReplace = currentNotes.index(of: oldNote) {
            // Replaces an updated note
            currentNotes.remove(oldNote)
            currentNotes.insert(note, at: indexToReplace)    
        }
        
        storage = currentNotes
    }
}
