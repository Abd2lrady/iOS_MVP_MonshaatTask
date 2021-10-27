//
//  ProfileScreenPresenter+ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

extension ProfileScreenPresenter: ProfileScreenPresenterProtocol {

    func viewLoaded() {
        configHeaderView()
        //        let test = "93f4d920-0720-4a84-8f84-fed97dfa49f2"
        getSessions(id: consultant.id ?? "", page: 1)
        getInfo(id: consultant.id ?? "")
    
    }
    
    func refreshProfileData() {
        for pageIndx in 1 ... currentPage {
            getSessions(id: consultant.id ?? "", page: pageIndx)
            getInfo(id: consultant.id ?? "")
            view?.dataRefreshed()
        }
    }
    
    func loadMoreSessions() {
        
        if currentPage < totalPages {
            currentPage += 1
            getSessions(id: consultant.id ?? "", page: currentPage + 1)
        } else {
            view?.noMoreSession()
        }
    }
    
}
