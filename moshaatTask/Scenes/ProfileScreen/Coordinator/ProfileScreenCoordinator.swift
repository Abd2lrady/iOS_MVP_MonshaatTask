//
//  ProfileScreenCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ProfileScreenCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    var router: RouterProtocol
    var consultant: Consultant
    init(router: RouterProtocol, consultant: Consultant) {
        self.router = router
        self.consultant = consultant
    }
}
