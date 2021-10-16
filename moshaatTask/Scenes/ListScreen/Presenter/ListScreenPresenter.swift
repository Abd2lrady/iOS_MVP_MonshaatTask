//
//  ConsultantViewPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ListScreenPresenter {
    
    weak var view: ListScreenViewProtocol?
    let consultantInteractor = ConsultantsInteractor()
    
    var consultants = [Consultant]()
    var totalConsultants = 0
    var currentPage = 1
    
    init(with view: ListScreenViewProtocol) {
        self.view = view
    }
    
    func getConsultantsList(with page: Int) {
        guard NetworkMonitor.shared.isConnected else {
            view?.showNoInternet()
            return }
        view?.hideNoInternet()
        consultantInteractor.getConsultants(page: currentPage) { [weak self] serverReponse, error in
            
            guard let consultantsResponse = serverReponse?.data,
                  let totalConsultants = serverReponse?.pagination?.total
            else {
                self?.view?.showError(message: error?.localizedDescription ?? "Error")
                self?.view?.hideActivityIndicator()
                return }
            
            self?.consultants = consultantsResponse
            self?.totalConsultants = totalConsultants
            self?.view?.consultantsLoaded()
            self?.view?.hideActivityIndicator()
        }
    }
            
}
