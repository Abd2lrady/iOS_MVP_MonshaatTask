//
//  BookingSheetCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
extension BookingSheetCoordinator: CoordinatorProtocol {    
    
    func start() {
        let view = BookingSheetVC()
        view.modalPresentationStyle = .overCurrentContext
        view.bookingSheetCoordinatorDelegate = self
        router.present(view: view, animated: false, completion: nil)
    }
 
}

extension BookingSheetCoordinator: BookingSheetCoordinatorDelegateProtocol {
    func dismissTap() {

        router.dismiss(animated: false)
        parentCoordinator?.removeChild(coordinator: self)
//        view.dismiss(animated: false, completion: nil)
    }
}
