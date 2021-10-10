//
//  NetworkManger+CategoriesService.swift
//  TaskMVP
//
//  Created by Ahmad Abdulrady

import Foundation
import Moya

extension NetworkManager {
    
    func request(target: TargetType,
                 completion: @escaping (_ result: Swift.Result<Data, NetworkError>,
                                        _ statusCode: StatusCode?) -> Void) {
        
        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    completion(.success(response.data), response.statusCode)
                } else if response.statusCode == 401 {
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        print(response.data)
                        let dataDict = try JSONSerialization.jsonObject(with: response.data,
                                                                        options: []) as? [String: Any]
                        if let error = dataDict?["error"] as? NSDictionary {
                            if let code = error["code"] as? Int {
                                businessError.code = code
                            }
                        }
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
    }
}
