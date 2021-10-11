//
//  Consultant.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

//struct ServerReponse: Codable, Hashable {
//    let status: Int?
//    let success: Bool?
//    let data: [Consultant]?
//    let pagination: Pagination?
//}

struct Consultant: Codable, Hashable {
    let id: String?
    let rating: Double?
    let aboutMe: String?
    let isAvailable: Bool?
    let isOnline: Bool?
    let ssoUser: SsoUser?
    let interests: [String]?
    let file: File?

    enum CodingKeys: String, CodingKey {
        case id
        case rating
        case aboutMe
        case isAvailable
        case isOnline
        case ssoUser = "sso_User"
        case interests
        case file
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(rating)
        hasher.combine(aboutMe)
        hasher.combine(isAvailable)
        hasher.combine(isOnline)
        hasher.combine(ssoUser)
        hasher.combine(interests)
        hasher.combine(file)
    }
}
