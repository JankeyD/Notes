//
//  AppDelegate.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit
import Core

@UIApplicationMain
class AppDelegate: ApplicationDelegate {
    
    override var coordinator: Coordinator? {
        return AppCoordinator(navigationController: navController)
    }
}
