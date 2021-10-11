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
        consultantInteractor.getConsultants { [weak self] consultants, error in
            guard let self = self else {fatalError("presenter not found")}
            guard let consultants = consultants else {
                print(error?.localizedDescription)
                fatalError("consultants empty, handle some errors")
                }
            self.consultants = consultants
            self.view?.consultantsLoaded()
            
            self.view?.hideActivityIndicator()
        }
    }

}
