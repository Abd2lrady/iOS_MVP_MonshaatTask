//
//  BookingSheetInteractor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

class BookingSheetInteractor {
    let networkManager = NetworkManager()
    
    func getCompanies(
        completionHandler: @escaping (ServerReponse<[Company]>?, Error?) -> Void
    ) {
        networkManager.request(target: BookingTarget.getCompanies) { result, _ in
            switch result {
            case let .failure(error):
                completionHandler(nil, error)
            case let .success(serverResponse):
                do {
                    let reponse = try JSONDecoder().decode(ServerReponse<[Company]>.self,
                                                           from: serverResponse)
                    completionHandler(reponse, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
    
    func getPorjects(
        completionHandler: @escaping (ServerReponse<[Project]>?, Error?) -> Void
    ) {
        networkManager.request(target: BookingTarget.getProjects) { result, _ in
            switch result {
            case .failure(let error):
                completionHandler(nil, error)
            case .success(let serverResponse):
                do {
                    let response = try JSONDecoder().decode(ServerReponse<[Project]>.self,
                                                            from: serverResponse)
                    completionHandler(response, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
