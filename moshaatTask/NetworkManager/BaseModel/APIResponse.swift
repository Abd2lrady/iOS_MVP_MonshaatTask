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

    enum CodingKeys: String, CodingKey {
        case data // = "data"
        case status // = "status"
        case success // = "success"
        case error // = "error"
        case message // = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ResponseType.self, forKey: .data)// try T(from: decoder)
        error = try values.decodeIfPresent(NetworkError.self, forKey: .error)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        if data is String, data == nil, let msg = message as? ResponseType {
            data = msg
        }
    }
}
