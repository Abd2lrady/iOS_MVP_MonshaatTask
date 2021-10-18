//
//  ProfileScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ProfileScreenPresenter {
    
    weak var view: ProfileScreenViewProtocol?
    
    init(view: ProfileScreenViewProtocol) {
        self.view = view
    }
}
