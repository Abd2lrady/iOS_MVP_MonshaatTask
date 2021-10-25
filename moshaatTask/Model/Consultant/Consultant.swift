//
//  Consultant.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct ServerReponse<ResponseType: Codable>: Codable {
    
    let status: Int?
    let success: Bool?
    let data: [ResponseType]?
    let pagination: Pagination?
 }

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
        case aboutMe = "about_me"
        case isAvailable = "is_available"
        case isOnline = "is_online"
        case ssoUser = "sso_user"
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
