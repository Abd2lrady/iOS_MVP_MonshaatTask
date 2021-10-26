//
//  ProfileScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenViewProtocol: AnyObject {
    var headerView: HeaderCardView? { get set }
    func infoDataLoaded()
    func sessionsDataLoaded()
    func dataRefreshed()
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(message: String)
    func showNoInternet()
    func hideNoInternet()
}
