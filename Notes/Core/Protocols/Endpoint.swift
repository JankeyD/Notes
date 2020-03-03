//
//  Endpoint.swift
//  Notes
//
//  Created by Roman Lazan on 14.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Foundation

/// Used to provide some information to endpoints, like the baseURL.
public protocol Endpoint {
    
    /// Used to provide the base URL.
    var baseURL: URL { get }
    
    
    /// Can be used to create a complete URL based on the baseURL.
    ///
    /// - Parameter path: The path which should be called.
    /// - Returns: The complete URL which is created by combining baseURL and path.
    func URL(appendedWith path: String) -> URL
}


// MARK: - Default Implementation

public extension Endpoint {
    
    /// Can be used to create a complete URL based on the baseURL.
    ///
    /// - Parameter path: The path which should be called.
    /// - Returns: The complete URL which is created by combining baseURL and path.
    func URL(appendedWith path: String) -> URL {
        return baseURL.appendingPathComponent(path)
    }
}

