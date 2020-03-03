//
//  AppDelegate.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
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

