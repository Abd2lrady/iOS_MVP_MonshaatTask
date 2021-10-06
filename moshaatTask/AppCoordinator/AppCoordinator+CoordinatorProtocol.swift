//
//  AppCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppCoordinator: CoordinatorProtocol {
    
    func start() {
        let main = ListScreenVC()
        window.rootViewController = main
        window.makeKeyAndVisible()
    }
    
}
