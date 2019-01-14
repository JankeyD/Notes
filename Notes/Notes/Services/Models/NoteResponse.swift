//
//  NoteResponse.swift
//  Notes
//
//  Created by Roman Lazan on 14.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

struct NoteResponse: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case notes
    }
    
    let notes: [Note]?
}
