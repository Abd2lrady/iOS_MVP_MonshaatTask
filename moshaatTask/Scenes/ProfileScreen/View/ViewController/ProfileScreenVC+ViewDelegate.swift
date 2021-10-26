//
//  ProfileScreenVC+ViewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ProfileScreenVC: ViewDelegate {
    func goToConsultantProfile(consultant: Consultant) {
        
    }

    func loadMore() {
        self.view.makeToastActivity(.bottom)
        presenter.loadMoreSessions()
    }
}
