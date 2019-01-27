//
//  Coordinator.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit


/// `Coordinator` pattern protocol
public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    /// Starts the coordinator.
    func start()
}
