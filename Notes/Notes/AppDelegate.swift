//
//  AppDelegate.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var coordinator: AppCoordinator?
    
    let navController: UINavigationController = {
        let navController = UINavigationController()
        navController.navigationBar.barTintColor = UIColor.groupTableViewBackground
        navController.view.backgroundColor = UIColor.groupTableViewBackground
        
        return navController
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator(navigationController: navController)
        
        coordinator?.start()
        
        setupAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setupAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
}

