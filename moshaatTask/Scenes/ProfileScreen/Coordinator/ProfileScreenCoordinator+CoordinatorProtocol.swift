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
        router.push(view: view, animated: true)
    }
}
