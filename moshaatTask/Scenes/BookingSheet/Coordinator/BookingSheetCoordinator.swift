//
//  BookingSheetCoordinator.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class BookingSheetCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    var router: RouterProtocol
    init(router: RouterProtocol) {
        self.router = router
    }
}
