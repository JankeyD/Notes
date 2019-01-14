//
//  Endpoint.swift
//  Notes
//
//  Created by Roman Lazan on 14.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Foundation

/// Used to provide some information to endpoints, like the baseURL.
protocol Endpoint {
    
    /// Used to provide the base URL.
    var baseURL: URL { get }
    
    
    /// Can be used to create a complete URL based on the baseURL.
    ///
    /// - Parameter path: The path which should be called.
    /// - Returns: The complete URL which is created by combining baseURL and path.
    func URL(appendedWith path: String) -> URL
}


// MARK: - Default Implementation

extension Endpoint {
    
    /// Used to provide the base URL.
    var baseURL: URL {
        let urlString = "https://private-anon-548f9f7393-note10.apiary-mock.com/"
        
        return Foundation.URL(string: urlString)!
    }
    
    
    /// Can be used to create a complete URL based on the baseURL.
    ///
    /// - Parameter path: The path which should be called.
    /// - Returns: The complete URL which is created by combining baseURL and path.
    func URL(appendedWith path: String) -> URL {
        return baseURL.appendingPathComponent(path)
    }
}

