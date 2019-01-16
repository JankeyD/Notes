//
//  JSONConvertible.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Foundation

protocol JSONConvertible {
    
    /// Failable initializer which takes `Data` as the input to transform it to a proper instance.
    ///
    /// - Parameter JSON: The `Data` which has to be transformed.
    init?(JSON: Data)
}

extension JSONConvertible where Self: Decodable {
    init?(JSON: Data) {
        do {
            self = try JSONDecoder().decode(Self.self, from: JSON)
        } catch let error {
            print(error)
            return nil
        }
    }
}
