//
//  ConsultantsInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ConsultantsInteractor {
    var consultants = [Consultant]()
    let networkManager = NetworkManager()
    
    func getConsultants(completionHander: @escaping ([Consultant]?, Error?) -> Void) {
        
        networkManager.request(target: ConsultantsTarget.getConsultants) { result, statusCode in
            switch result {
            case.success(let response):
                do {
                    let serverResponse = try JSONDecoder().decode(APIResponse<[Consultant]>.self, from: response)
                    completionHander(serverResponse.data, nil)
                    print(serverResponse.data)
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
