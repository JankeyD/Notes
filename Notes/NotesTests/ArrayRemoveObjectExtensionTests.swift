//
//  ArrayRemoveObjectExtensionTests.swift
//  NotesTests
//
//  Created by Roman Lazan on 18.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import XCTest
@testable import Notes

class ArrayRemoveObjectExtensionTests: XCTestCase {
    
    var notes: [Note] = []
    
    let note1 = Note(id: 1, title: "test")
    let note2 = Note(id: 2, title: "test")
    let note3 = Note(id: 3, title: "test")
    
    override func setUp() {
        super.setUp()
        
        notes.append(note1)
        notes.append(note2)
        notes.append(note3)
    }
    
    override func tearDown() {
        notes.removeAll()
        super.tearDown()
    }
    
    func testRemoveObject() {
        notes.remove(note2)
        
        XCTAssertEqual(notes, [note1, note3])
    }
}
