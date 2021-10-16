//
//  ListScreenView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenViewProtocol: AnyObject {
    var  listScreenActions: ListScreenActions? { get set }
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
