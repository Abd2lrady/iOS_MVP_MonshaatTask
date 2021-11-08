//
//  BookingTarget+TargetType.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady \

import Foundation
import Moya

extension BookingTarget: TargetType {
    var baseURL: URL {
        return EnviromentVariables.baseURl
    }
    
    var path: String {
        switch self {
        case .getCompanies:
            return "api/profile/sme/companies"
        case .getProjects:
            return "api/profile/projects"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
