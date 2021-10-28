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
    var session: FormattedSession?
    var selectedAppointment: Int
    init(router: RouterProtocol,
         parentCoordinator: CoordinatorProtocol,
         session: FormattedSession?,
         selectedAppointment: Int) {
        self.router = router
        self.parentCoordinator = parentCoordinator
        self.session = session
        self.selectedAppointment = selectedAppointment
    }
}
