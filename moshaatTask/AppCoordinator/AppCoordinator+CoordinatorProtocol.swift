//
//  AppCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppCoordinator: CoordinatorProtocol {
    
    func start() {
        
        let navigator = UINavigationController()
        let router = Router(navigator: navigator)
        let listScreenCoordinator = ListScreenCoordinator(router: router)
        self.childCoordinators.append(listScreenCoordinator)
        listScreenCoordinator.start()
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
    
}
