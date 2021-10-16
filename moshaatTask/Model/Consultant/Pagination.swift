//
//  pagination.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

struct Pagination: Codable, Hashable {
    let count: Int?
    let total: Int?
    let perPage: Int?
    let currentPage: Int?
    let totalPages: Int?
}
