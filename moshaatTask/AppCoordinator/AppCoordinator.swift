//
//  AppCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class AppCoordinator {
    
    let window: UIWindow
    var childCoordinators = [CoordinatorProtocol]()
    
    init(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        NetworkMonitor.shared.isConnected
    }
    
}
