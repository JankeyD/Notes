//
//  HasNotesService.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

/// Used for dependency containers to make the notes service available.
protocol HasNotesService {
    
    /// Used to store the notes service reference.
    var notesService: NotesServiceType { get }
}
