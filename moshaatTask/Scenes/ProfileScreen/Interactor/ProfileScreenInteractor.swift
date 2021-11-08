//
//  SessionsInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ProfileScreenInteractor {
    private let networkManager = NetworkManager()
    
    func getSessions(id: String,
                     page: Int,
                     completionHandler: @escaping (ServerReponse<[Session]>?, Error?) -> Void) {
        networkManager.request(target: ProfileTarget.getSessions(id: id,
                                                                 page: page)) { result, _ in
            switch result {
            case .success(let resultData):
                do {
                    let response = try JSONDecoder().decode(ServerReponse<[Session]>.self, from: resultData)
                    completionHandler(response, nil)
                } catch {
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func getInfo(id: String,
                 completionHander: @escaping (ServerReponse<Info>?, Error?) -> Void) {
        networkManager.request(target: ProfileTarget.getInfo(id: id)) { result, _ in
            switch result {
            case.failure(let error):
                completionHander(nil, error)
            case .success(let responseData):
                do {
                    let serverResponse = try JSONDecoder().decode(ServerReponse<Info>.self,
                                                                  from: responseData)
                    completionHander(serverResponse, nil)
                } catch {
                    completionHander(nil, error)
                }
            }
        }
    }
    
}
