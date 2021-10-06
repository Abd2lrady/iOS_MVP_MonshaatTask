//
//  ListScreenCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ListScreenCoordinator {
    
    var childCoordinators = [CoordinatorProtocol]()
    let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
}
