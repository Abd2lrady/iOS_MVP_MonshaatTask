//
//  ProfileScreenCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ProfileScreenCoordinator: CoordinatorProtocol {
    
    func start() {
        let view = ProfileScreenVC()
        let presenter = ProfileScreenPresenter(view: view, consultant: consultant)
        view.presenter = presenter
        view.profileCoordinatorDelegate = self
        router.push(view: view, animated: true)
    }
}

extension ProfileScreenCoordinator: ProfileScreenCoordinatorProtocol {
    func bookButtonTapped(with session: Session?) {
        print("coordinator notifies")
        let bookingCoordinator = BookingSheetCoordinator(router: router)
        childCoordinators.append(bookingCoordinator)
        bookingCoordinator.start()
    }
}
