//
//  ProfileScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenViewProtocol: AnyObject {
    var headerView: HeaderCardView? { get set }
    var noSessions: Bool { get set }
    func infoDataLoaded()
    func sessionsDataLoaded()
    func moreSessionsLoaded()
    func noMoreSession()
    func dataRefreshed()
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(message: String)
    func showNoInternet()
    func hideNoInternet()
}
