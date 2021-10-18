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
    
    func startProfileScreen() {
        let profileScreenCoordinator = ProfileScreenCoordinator(router: router)
        self.childCoordinators.append(profileScreenCoordinator)
        profileScreenCoordinator.start()
    }
}
