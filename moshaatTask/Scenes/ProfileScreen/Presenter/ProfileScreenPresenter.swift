//
//  ProfileScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ProfileScreenPresenter {
    weak var view: ProfileScreenViewProtocol?
    let id: String
    var page = 1
    var totalPages = 1
    var sessions = [Session]()
    let sessionsInteractor = SessionsInteractor()

    init(view: ProfileScreenViewProtocol, id: String) {
        self.view = view
        self.id = id
    }
    
    func configSessionsData() {
        
    }
    
}
