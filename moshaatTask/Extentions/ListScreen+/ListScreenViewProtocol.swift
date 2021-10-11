//
//  ListScreenView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenViewProtocol: AnyObject {
    func consultantsLoaded()
    func showError(message: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}
