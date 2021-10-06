//
//  CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    
    func start()
}
