//
//  NotesViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 15.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import RxCocoa

class NotesViewModel: ViewModel {
    let notes = BehaviorRelay<[Note]>(value: [])
    
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
                    self.notes.accept(notes)
                }
            }
            
            if case .failure(let error) = response {
                print(error)
            }
        }
    }
}
