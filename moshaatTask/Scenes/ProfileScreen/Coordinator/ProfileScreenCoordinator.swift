//
//  ProfileScreenCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ProfileScreenCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    var router: RouterProtocol
    var id: String
    init(router: RouterProtocol, id: String) {
        self.router = router
        self.id = id
    }
}
