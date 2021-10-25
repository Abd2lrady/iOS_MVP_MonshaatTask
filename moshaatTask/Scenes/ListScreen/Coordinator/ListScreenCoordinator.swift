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
    
    func startProfileScreen(id: String) {
        let profileScreenCoordinator = ProfileScreenCoordinator(router: router, id: id)
        self.childCoordinators.append(profileScreenCoordinator)
        profileScreenCoordinator.start()
    }
}
