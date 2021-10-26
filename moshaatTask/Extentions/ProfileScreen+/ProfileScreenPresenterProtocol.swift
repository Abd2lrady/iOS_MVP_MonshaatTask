//
//  ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenPresenterProtocol {
    var sessions: [Session] { get set }
    var info: Info? { get set }
    func viewLoaded()
    func refreshProfileData()
}
