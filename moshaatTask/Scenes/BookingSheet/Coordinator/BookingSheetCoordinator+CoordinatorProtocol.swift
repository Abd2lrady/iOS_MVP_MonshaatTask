//
//  BookingSheetCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
extension BookingSheetCoordinator: CoordinatorProtocol {    
    
    func start() {
        let view = BookingSheetVC()
        router.present(view: view, animated: false, completion: nil)
    }
 
}
