//
//  Info.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct Info: Codable {
    let aboutMe: String?
    let interests: [String]?
    
    enum CodingKeys: String, CodingKey {
        case aboutMe = "about_me"
        case interests
    }
}
