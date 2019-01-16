//
//  NoteResponse.swift
//  Notes
//
//  Created by Roman Lazan on 14.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import Foundation

struct NoteResponse: Decodable, JSONConvertible {
    
    let notes: [Note]?
    
    init?(JSON: Data) {
        do {
            notes = try JSONDecoder().decode([Note].self, from: JSON)
        } catch let error {
            print(error)
            return nil
        }
    }
}
