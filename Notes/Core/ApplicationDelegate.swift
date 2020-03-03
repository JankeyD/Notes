//
//  ApplicationDelegate.swift
//  Core
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

open class ApplicationDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    open var coordinator: Coordinator? {
        get {
            preconditionFailure("override this")
        }
    }
    
    public let navController: UINavigationController = {
        let navController = UINavigationController()
        navController.navigationBar.barTintColor = UIColor.groupTableViewBackground
        navController.view.backgroundColor = UIColor.groupTableViewBackground
        
        return navController
    }()
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
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
