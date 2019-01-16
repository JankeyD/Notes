//
//  ServiceLocator.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

enum ServiceLocator {
    typealias Recipe = () -> Any
    
    fileprivate static var registry: Dictionary<String, Recipe> = [:]
    
    private static func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
    
    static func addService<T>(recipe: @escaping () -> T) {
        let key = typeName(some: T.self)
        registry[key] = recipe
    }
    
    static func locateService<T>() -> T? {
        let key = typeName(some: T.self)
        return registry[key]?() as? T
    }
    
    static func removeService<T>() -> T? {
        let key = typeName(some: T.self)
        return registry.removeValue(forKey: key)?() as? T
    }
    
    static func removeAll() {
        registry.removeAll()
    }
}
