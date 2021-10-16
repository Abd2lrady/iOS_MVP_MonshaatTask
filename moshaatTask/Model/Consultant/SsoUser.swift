//
//  Sso.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

struct SsoUser: Codable, Hashable {
    let id: String?
    let fullName: String?
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case bio
    }
}
