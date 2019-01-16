//
//  NoteViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import RxCocoa

class NoteViewModel: ViewModel {
    let note = BehaviorRelay<Note?>(value: nil)
    
    init(note: Note) {
        self.note.accept(note)
    }
}
