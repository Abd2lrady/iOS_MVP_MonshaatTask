//
//  ListScreenPresenter+ListScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenPresenter: ListScreenPresenterProtocol {
    
    func viewLoaded() {
        view?.showActivityIndicator()
        getConsultantsList()
    }
    
    func loadMoreConsultants() {
         
    }
    
    func refreshConsultantData() {
         
    }
    
}
