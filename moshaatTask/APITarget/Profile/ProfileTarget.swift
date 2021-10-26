//
//  SessionsTarget.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

enum ProfileTarget {
    case getSessions(id: String, page: Int)
    case getInfo(id: String)
}
