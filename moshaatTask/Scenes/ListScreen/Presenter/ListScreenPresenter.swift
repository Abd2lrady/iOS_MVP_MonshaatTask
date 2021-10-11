//
//  ConsultantViewPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ListScreenPresenter {
    weak var view: ListScreenViewProtocol?
    let consultantInteractor = ConsultantsInteractor()
    
    init(with view: ListScreenViewProtocol) {
        self.view = view
    }

}
