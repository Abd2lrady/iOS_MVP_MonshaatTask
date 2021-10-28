//
//  ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenPresenterProtocol {
    var formattedSessions: [FormattedSession] { get set }
    var info: Info? { get set }
    func viewLoaded()
    func loadMoreSessions()
    func refreshProfileData()
}
