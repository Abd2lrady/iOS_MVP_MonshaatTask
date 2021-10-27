//
//  BookingSheetCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class BookingSheetCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    weak var parentCoordinator: CoordinatorProtocol?
    var router: RouterProtocol
    init(router: RouterProtocol, parentCoordinator: CoordinatorProtocol) {
        self.router = router
        self.parentCoordinator = parentCoordinator
    }
}
