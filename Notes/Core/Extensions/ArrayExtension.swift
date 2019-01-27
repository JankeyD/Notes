//
//  ArrayExtension.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Foundation

public extension Array {
    mutating func remove<T>(_ obj: T) where T : Equatable {
        self = self.filter({$0 as? T != obj})
    }
}
