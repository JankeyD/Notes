//
//  Endpoint.swift
//  Notes
//
//  Created by Roman Lazan on 14.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core


extension Endpoint {
    
    /// Used to provide the base URL.
    var baseURL: URL {
        let urlString = "https://private-anon-548f9f7393-note10.apiary-mock.com/"
        
        return Foundation.URL(string: urlString)!
    }
}

