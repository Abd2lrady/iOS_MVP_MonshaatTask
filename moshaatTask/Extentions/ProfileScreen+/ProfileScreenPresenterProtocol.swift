//
//  ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenPresenterProtocol {
    var sessions: [Session] { get set }
    func viewLoaded()
    func refreshProfileData()
}
