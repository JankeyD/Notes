//
//  AppCoordinator.swift
//  AirBank
//
//  Created by Roman Lazan on 27.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//


import UIKit
import Core

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ListViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = TransactionsViewModel(dependencies: ServiceDependencyContainer())
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showTransactionDetail() {
        
    }
}
