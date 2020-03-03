//
//  Dynamic.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

public class Dynamic<T> {
    public typealias Listener = (T)->()
    
    private var listener: Listener?
    
    public var value:T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    public func unbind() {
        listener = nil
    }
}
