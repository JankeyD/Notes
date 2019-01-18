//
//  NotesServiceType.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit

protocol NotesServiceType {
    
    @discardableResult func getNotes(completion: @escaping (ServiceResult<NotesResponse>) -> Void) -> Procedure?
    
    @discardableResult func createNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure?
    
    @discardableResult func updateNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure?
    
    @discardableResult func deleteNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure?
}
