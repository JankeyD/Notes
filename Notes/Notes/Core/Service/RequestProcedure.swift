//
//  RequestProcedure.swift
//  Notes
//
//  Created by Roman Lazan on 13.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import ProcedureKit
import Alamofire


final class RequestProcedure<RequestType: Decodable>: Procedure {
    private let _URL: URL
    private let _data: RequestType
    private let _method: HTTPMethod
    
    var request: DataRequest?
    var response: DefaultDataResponse?
    
    init(url: URL, data: RequestType, method: HTTPMethod) {
        _URL = url
        _data = data
        _method = method
        
        super.init()
        
        name = "NotesRequestProcedure"
    }
    
    
    override func execute() {
        guard let request = try? URLRequest(url: _URL, method: _method), !isCancelled else { return }
        
        self.request = _sessionManager.request(request)
            .validate()
            .response(completionHandler: { [weak self] response in
                guard let cancelled = self?.isCancelled, !cancelled else { return }
                
                self?.response = response
                
                self?.finish()
            })
    }
}

/// This class can be used to send a request without a body.
final class EmptyRequestProcedure: Procedure {
    private let _URL: URL
    private let _method: HTTPMethod
    
    
    /// The actual request will be stored in here
    var request: DataRequest?
    
    /// The response of the service
    var response: DefaultDataResponse?
    
    
    /// Used to create a new procedure to send a network request.
    ///
    /// - Parameters:
    ///   - URL: The URL which should be called
    ///   - method: The HTTP method.
    init(URL: URL, method: HTTPMethod) {
        _URL = URL
        _method = method
        
        super.init()
        
        name = "NotesRequestProcedure"
    }
    
    
    /// Executes the procedure. This will actually convert the data (if available) via JSONEncoder and send the request.
    override func execute() {
        guard let request = try? URLRequest(url: _URL, method: _method), !isCancelled else { return }
        
        self.request = _sessionManager.request(request)
            .validate()
            .response(completionHandler: { [weak self] response in
                guard let cancelled = self?.isCancelled, !cancelled else { return }
                
                self?.response = response
                
                self?.finish()
            })
    }
}

private let _sessionManager: Alamofire.SessionManager = {
   let sessionManager = SessionManager()
    
    return sessionManager
}()


