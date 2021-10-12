//
//  ListScreenPresenter+ListScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

extension ListScreenPresenter: ListScreenPresenterProtocol {
    
    func viewLoaded() {
        page = 1
        getConsultantsList(with: page)
    }
    
    func loadMoreConsultants() {
        
        if consultants.count < totalConsultants {
            page += 1
            getConsultantsList(with: page)
            view?.moreConsultantsLoaded()
        } else {
            view?.noMoreConsultants()
        }
    }
    
    func refreshConsultantData() {
        for pageIndx in 1 ..< page {
            getConsultantsList(with: pageIndx)
        }
        view?.consultantRefreshed()
    }

}
    
