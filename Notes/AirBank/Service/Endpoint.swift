//
//  Endpoint.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Core

extension Endpoint {
    
    /// Used to provide the base URL.
    var baseURL: URL {
        let urlString = "https://demo0569565.mockable.io/"
        
        return Foundation.URL(string: urlString)!
    }
}
