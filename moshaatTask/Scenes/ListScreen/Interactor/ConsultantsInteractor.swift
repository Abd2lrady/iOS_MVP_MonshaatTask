//
//  ConsultantsInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ConsultantsInteractor {
    var consultants = [Consultant]()
    let networkManager = NetworkManager()
    
    func getConsultants(completionHander: @escaping (ServerReponse?, Error?) -> Void) {

        networkManager.request(target: ConsultantsTarget.getConsultants) { result, _ in
            switch result {
            case.success(let response):
                do {
                    let serverResponse = try JSONDecoder().decode(ServerReponse.self, from: response)
                    completionHander(serverResponse, nil)
//                    print(serverResponse.data)
                } catch(let error) {
                    print(error.localizedDescription)
                    completionHander(nil, error)
                }
            case .failure(let error):
                completionHander(nil, error)
            }
        }
    }
}
