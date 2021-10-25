//
//  SessionsInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class SessionsInteractor {
    var sessions = [Session]()
    let networkManager = NetworkManager()
    
    func getSessions(id: String,
                     page: Int,
                     completionHandler: @escaping (ServerReponse<Session>?, Error?) -> Void) {
        networkManager.request(target: SessionsTarget.getSessions(id: id,
                                                                  page: page)) { result, _ in
            switch result {
            case .success(let resultData):
                do {
                    let response = try JSONDecoder().decode(ServerReponse<Session>.self, from: resultData)
                    completionHandler(response, nil)
                } catch {
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
            completionHandler(nil, error)
            }
        }
    }
    
}
