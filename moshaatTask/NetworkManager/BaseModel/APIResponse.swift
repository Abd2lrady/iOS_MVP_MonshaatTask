//
//  APIResponse.swift
//

import Foundation

// MARK: - APIResponse
struct APIResponse<ResponseType: Codable>: Codable {

    var data: ResponseType?
    let status: Int?
    let success: Bool?
    let error: NetworkError?
    let message: String?

}
