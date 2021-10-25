//
//  SessionTarget+TargetType.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Moya

extension SessionsTarget: TargetType {
    var baseURL: URL {
        return EnviromentVariables.baseURl
    }
    
    var path: String {
        switch self {
        case .getSessions(let id, _):
            return "api/schedule/contributor/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSessions:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getSessions(_, let page):
            return .requestParameters(parameters: ["page": page],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
