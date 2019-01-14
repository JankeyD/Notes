//
//  Service.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Alamofire
import ProcedureKit

class Service {
    
    private enum ServiceSettings {
        static var timeout: TimeInterval = 30
    }
    
    func request<ResponseType>(_ url: URL, method: HTTPMethod = .get, on queue: ProcedureQueue, completion: ((ServiceResult<ResponseType>) -> Void)? = nil) -> Procedure {
        let requestProcedure = EmptyRequestProcedure(URL: url, method: method)
        
        requestProcedure.add(observer: NetworkObserver())
        requestProcedure.add(observer: TimeoutObserver(by: ServiceSettings.timeout))
        
        requestProcedure.add(observer: BlockObserver(didCancel: { procedure, _ in
            
        }, willFinish: { procedure, _, _ in
            if procedure.isCancelled { return }
            
            guard let response = (procedure as? EmptyRequestProcedure)?.response else {
                completion?(ServiceResult<ResponseType>.failure(ErrorType.noResponse, nil))
                
                return
            }
            
            completion?(self.handleResponse(response))
        }))
        
        queue.add(operation: requestProcedure)
        
        return requestProcedure
    }
    
    /// Used to handle the actual response of the request.
    ///
    /// - Parameter response: The response which should be handled.
    /// - Returns: The parsed result or an error which occurred while parsing the response.
    private func handleResponse<ResponseType>(_ response: DefaultDataResponse) -> ServiceResult<ResponseType> {
        
        var data: ResponseType? = nil
        
        // Check for data. No data found? Stop again.
        guard let responseData = response.data else {
            
            // Found an error? Invoke completion handler and stop right there.
            if let error = response.error {
                return ServiceResult<ResponseType>.failure(error, nil)
            }
            
            return ServiceResult<ResponseType>.success(data)
        }
        
        // Actually parse the response
        data = ResponseType(JSON: responseData)
        
        // Found an error? Invoke completion handler and stop right there.
        if let error = response.error {
            return ServiceResult<ResponseType>.failure(error, data)
        }
        
        return ServiceResult<ResponseType>.success(data)
    }
}
