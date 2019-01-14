//
//  NotesServiceType.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit

protocol NotesServiceType {
    
    @discardableResult func getNotes(completion: @escaping (ServiceResult<NoteResponse>) -> Void) -> Procedure?
}
