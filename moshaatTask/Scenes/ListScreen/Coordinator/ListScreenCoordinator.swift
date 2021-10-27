//
//  ListScreenCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ListScreenCoordinator {
    
    var childCoordinators = [CoordinatorProtocol]()
    let router: RouterProtocol
    weak var parentCoordinator: CoordinatorProtocol?
    init(router: RouterProtocol, parentCoordinator: CoordinatorProtocol) {
        self.router = router
        self.parentCoordinator = parentCoordinator
    }
    
    func startProfileScreen(consultant: Consultant) {
        let profileScreenCoordinator = ProfileScreenCoordinator(router: router,
                                                                parentCoordinator: self,
                                                                consultant: consultant)
        self.childCoordinators.append(profileScreenCoordinator)
        profileScreenCoordinator.start()
    }
}
