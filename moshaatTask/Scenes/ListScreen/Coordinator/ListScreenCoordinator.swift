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
    
    func startProfileScreen(consultant: Consultant) {
        let profileScreenCoordinator = ProfileScreenCoordinator(router: router, consultant: consultant)
        self.childCoordinators.append(profileScreenCoordinator)
        profileScreenCoordinator.start()
    }
}
