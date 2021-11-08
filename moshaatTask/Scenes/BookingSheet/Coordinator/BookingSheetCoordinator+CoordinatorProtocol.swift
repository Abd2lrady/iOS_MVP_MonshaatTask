//
//  BookingSheetCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
extension BookingSheetCoordinator: CoordinatorProtocol {    
    
    func start() {
        let view = BookingSheetVC()
        let presenter = BookingSheetPresenter(view: view,
                                              session: session,
                                              selectedAppointment: selectedAppointment)
        view.modalPresentationStyle = .overCurrentContext
        view.bookingSheetCoordinatorDelegate = self
        view.presenter = presenter
        router.present(view: view, animated: false, completion: nil)

//        router.push(view: view, animated: false)
    }
 
}

extension BookingSheetCoordinator: BookingSheetCoordinatorDelegateProtocol {
    func dismissTap() {
        router.dismiss(animated: false)
        parentCoordinator?.removeChild(coordinator: self)
//        view.dismiss(animated: false, completion: nil)
    }
}
