//
//  Dynamic.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

class Dynamic<T> {
    typealias Listener = (T)->()
    
    var listener: Listener?
    
    var value:T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func unbind() {
        listener = nil
    }
}
