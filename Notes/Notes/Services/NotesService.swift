//
//  NotesService.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit

class NotesService: Service, NotesServiceType {
    private static let queue = ProcedureQueue()
    
    /// Used to store all service relevant endpoints.
    private enum Endpoints: Endpoint {
        case noteList
        
        /// Returns the complete service URL.
        var url: URL {
            switch self {
            case .noteList:
                return URL(appendedWith: "notes")
            }
        }
    }
    
    func getNotes(completion: @escaping (ServiceResult<NoteResponse>) -> Void) -> Procedure? {
        return request(Endpoints.noteList.url, on: NotesService.queue, completion: completion)
    }
}
