//
//  ConsultantTraget+TargetType.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Moya

extension ConsultantsTarget: TargetType {
    var baseURL: URL {
        return EnviromentVariables.baseURl
    }
    
    var path: String {
        switch self {
        case .getConsultants:
            return "api/profile/bsa"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getConsultants:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
