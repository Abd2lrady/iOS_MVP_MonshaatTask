//
//  ListScreenCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenCoordinator: CoordinatorProtocol {
    
    func start() {
        let view = ListScreenVC()
        let presenter = ListScreenPresenter(with: view)
        view.presenter = presenter
        router.push(view: view, animated: true)
    }
}
