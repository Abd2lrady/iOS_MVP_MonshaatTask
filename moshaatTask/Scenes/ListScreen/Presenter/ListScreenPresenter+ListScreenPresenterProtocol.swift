//
//  ListScreenPresenter+ListScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenPresenter: ListScreenPresenterProtocol {
    
    func viewLoaded() {
        view?.showActivityIndicator()
        view?.listScreenActions = .viewLoaded
        getConsultantsList(with: 1)
    }
    
    func loadMoreConsultants() {
        view?.listScreenActions = .loadMoreConsultants
        if consultants.count < totalConsultants {
            currentPage += 1
            getConsultantsList(with: currentPage)
        } else {
            view?.noMoreConsultants()
        }
    }
    
    func refreshConsultantData() {
        view?.listScreenActions = .refreshConsultants
        for pageIndx in 1 ... currentPage {
            getConsultantsList(with: pageIndx)
        }
    }
}
    
