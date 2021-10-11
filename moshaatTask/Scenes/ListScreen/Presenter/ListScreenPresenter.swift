//
//  ConsultantViewPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ListScreenPresenter {
    weak var view: ListScreenViewProtocol?
    var consultants = [Consultant]()
    let consultantInteractor = ConsultantsInteractor()
    
    init(with view: ListScreenViewProtocol) {
        self.view = view
    }
    
    func getConsultantsList() {
        guard !NetworkMonitor.shared.isConnected else { fatalError("no internet") }
        consultantInteractor.getConsultants { [weak self] serverReponse, error in
            guard let self = self else { fatalError("presenter not found") }
            guard let consultants = serverReponse?.data else {
//                print(error?.localizedDescription)
//                fatalError("consultants empty, handle some errors")
                self.view?.showError(message: error?.localizedDescription ?? "Error")
                return
            }
            self.consultants = consultants
            self.view?.consultantsLoaded()
            self.view?.hideActivityIndicator()
        }
    }

}
