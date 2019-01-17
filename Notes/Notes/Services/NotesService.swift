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
        case createNote
        case updateNote
        
        /// Returns the complete service URL.
        var url: URL {
            switch self {
            case .noteList, .createNote, .updateNote:
                return URL(appendedWith: "notes")
            }
        }
    }
    
    func getNotes(completion: @escaping (ServiceResult<NotesResponse>) -> Void) -> Procedure? {
        return request(Endpoints.noteList.url, on: NotesService.queue, completion: completion)
    }
    
    func createNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure? {
       return request(Endpoints.createNote.url, parameters: note, on: NotesService.queue, completion: completion)
    }
    
    func updateNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure? {
        guard let id = note.id else {
            completion(ServiceResult.failure(ErrorType.noResponse, nil))
            return nil
        }
        
        let url = Endpoints.updateNote.url.appendingPathComponent(String(id), isDirectory: false)
        
        return request(url, method: .put, parameters: note, on: NotesService.queue, completion: completion)
    }
}
