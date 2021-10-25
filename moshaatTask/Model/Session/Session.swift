//
//  Session.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct Session: Codable {
    let day: Int?
    let schedules: [Schedule]?
}
