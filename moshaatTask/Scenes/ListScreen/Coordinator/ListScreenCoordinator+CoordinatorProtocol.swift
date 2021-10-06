//
//  ListScreenCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenCoordinator: CoordinatorProtocol {
    
    func start() {
        let listScreenVC = ListScreenVC()
        router.push(view: listScreenVC, animated: true)
    }
}
