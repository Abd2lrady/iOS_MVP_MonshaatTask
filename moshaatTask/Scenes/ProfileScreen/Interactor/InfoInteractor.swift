//
//  InfoInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class InfoInteractor {
    private let networkManger = NetworkManager()
    func getInfo(id: String,
                 completionHander: @escaping (ServerReponse<Info>?, Error?) -> Void) {
        networkManger.request(target: ProfileTarget.getInfo(id: id)) { result, _ in
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
