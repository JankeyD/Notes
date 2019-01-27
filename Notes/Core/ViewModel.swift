//
//  ViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

public enum ViewModelState {
    case valid
    case invalid
    case loading
}

open class ViewModel {
    public var state: Dynamic<ViewModelState> = Dynamic(.valid)
    public var message: Dynamic<String?> = Dynamic(nil)
    
    public init() {}
}
