//
//  Session.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct Session: Codable {
    var day: Int?
    let schedules: [Schedule]?
}
