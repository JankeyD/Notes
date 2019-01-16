//
//  ServiceDependencyContainer.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

struct ServiceDependencyContainer {}

extension ServiceDependencyContainer: HasNotesService {
    
    /// Used to store the notes service reference.
    var  notesService: NotesServiceType {
        if let notesService: NotesServiceType = ServiceLocator.locateService() {
            return notesService
        }
        
        let notesService = NotesService()
        
        ServiceLocator.addService { () -> NotesServiceType in
            notesService
        }
        
        return notesService
    }
}
