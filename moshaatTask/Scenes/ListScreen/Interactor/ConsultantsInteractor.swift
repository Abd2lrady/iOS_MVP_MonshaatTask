//
//  ConsultantsInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ConsultantsInteractor {
    var consultants = [Consultant]()
    let networkManager = NetworkManager()
    
    func getConsultants(page: Int,
                        completionHander: @escaping (ServerReponse<[Consultant]>?, Error?) -> Void) {

        networkManager.request(target: ConsultantsTarget.getConsultants(page: page)) { result, _ in
            switch result {
            case.success(let response):
                do {
                    let serverResponse = try JSONDecoder().decode(ServerReponse<[Consultant]>.self, from: response)
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
