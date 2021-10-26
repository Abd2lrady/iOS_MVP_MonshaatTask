//
//  SessionTarget+TargetType.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Moya

extension ProfileTarget: TargetType {
    var baseURL: URL {
        return EnviromentVariables.baseURl
    }
    
    var path: String {
        switch self {
        case .getSessions(let id, _):
            return "api/schedule/contributor/\(id)"
        case .getInfo(let id):
        return "api/profile/contributor/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getSessions(_, let page):
            return .requestParameters(parameters: ["page": page],
                                      encoding: URLEncoding.default)
        case .getInfo:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
