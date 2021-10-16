//
//  ListScreenView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenViewProtocol: AnyObject {
    var  retryActions: RetryActions? { get set }
    func consultantsLoaded()
    func consultantRefreshed()
    func moreConsultantsLoaded()
    func noMoreConsultants()
    func showNoInternet()
    func showError(message: String)
    func showActivityIndicator()
    func hideActivityIndicator()
    func hideNoInternet()
}
