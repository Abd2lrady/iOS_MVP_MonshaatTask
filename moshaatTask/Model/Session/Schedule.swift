//
//  Schedule.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct Schedule: Codable {
    let startTime: Int?
    let office: Office?
    
    enum  CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case office
    }
}
