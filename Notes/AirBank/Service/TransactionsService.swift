//
//  TransactionsService.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit
import Core

class TransactionsService: Service, TransactionsServiceType {
    private static let queue = ProcedureQueue()
    
    /// Used to store all service relevant endpoints.
    private enum Endpoints: Endpoint {
        case transactionList
        case transactionDetail
    
        
        /// Returns the complete service URL.
    var url: URL {
            switch self {
            case .transactionList, .transactionDetail:
                return URL(appendedWith: "transactions")
            }
        }
    }
    
    func getTransactionList(completion: @escaping (ServiceResult<TransactionsResponse>) -> Void) -> Procedure? {
        return request(Endpoints.transactionList.url, on: TransactionsService.queue, completion: completion)
    }
    
//    func getTransactionDetail(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure? {
//        return request(Endpoints.noteList.url, on: NotesService.queue, completion: completion)
//    }
//
//    func getNotes(completion: @escaping (ServiceResult<NotesResponse>) -> Void) -> Procedure? {
//        return request(Endpoints.noteList.url, on: NotesService.queue, completion: completion)
//    }
//
//    func createNote(_ note: Note, completion: @escaping (ServiceResult<Note>) -> Void) -> Procedure? {
//        return request(Endpoints.createNote.url, parameters: note, on: NotesService.queue, completion: completion)
//    }
}

