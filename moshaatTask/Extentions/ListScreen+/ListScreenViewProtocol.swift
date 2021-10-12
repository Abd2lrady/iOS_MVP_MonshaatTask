//
//  ListScreenView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenViewProtocol: AnyObject {
    func consultantsLoaded()
    func consultantRefreshed()
    func moreConsultantsLoaded()
    func noMoreConsultants()
    func showError(message: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}
