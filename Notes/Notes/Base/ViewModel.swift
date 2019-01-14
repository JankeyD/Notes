//
//  ViewModel.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

enum ViewModelState {
    case valid
    case invalid
    case loading
}

class ViewModel {
    var state: Dynamic<ViewModelState> = Dynamic(.valid)
    var message: Dynamic<String?> = Dynamic(nil)
}
