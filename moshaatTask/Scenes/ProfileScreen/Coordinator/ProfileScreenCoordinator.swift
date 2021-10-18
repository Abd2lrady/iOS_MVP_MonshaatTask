//
//  ProfileScreenCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ProfileScreenCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
