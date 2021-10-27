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
    weak var parentCoordinator: CoordinatorProtocol?
    init(router: RouterProtocol, parentCoordinator: CoordinatorProtocol, consultant: Consultant) {
        self.router = router
        self.parentCoordinator = parentCoordinator
        self.consultant = consultant
    }

}
