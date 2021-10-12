//
//  ListScreenPresenter+ListScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenPresenter: ListScreenPresenterProtocol {
    
    func viewLoaded() {
        view?.showActivityIndicator()
        view?.retryActions = .viewLoaded
        page = 1
        getConsultantsList(with: page)
    }
    
    func loadMoreConsultants() {
        view?.retryActions = .loadMoreConsultants
        if consultants.count < totalConsultants {
            page += 1
            getConsultantsList(with: page)
            view?.moreConsultantsLoaded()
        } else {
            view?.noMoreConsultants()
        }
    }
    
    func refreshConsultantData() {
        view?.retryActions = .refreshConsultants
        for pageIndx in 0 ..< page {
            getConsultantsList(with: pageIndx + 1)
        }
        view?.consultantRefreshed()
    }

}
    
