//
//  Note.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

struct Note: Decodable, JSONConvertible {
    enum CodingKeys: String, CodingKey {
        case id
        case title
    }
    
    let id: Int?
    var title: String?
}

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}
