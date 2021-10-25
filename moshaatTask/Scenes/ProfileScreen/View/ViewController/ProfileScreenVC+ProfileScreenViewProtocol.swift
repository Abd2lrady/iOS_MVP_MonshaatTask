//
//  ProfileScreenVC+ProfileScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Toast

extension ProfileScreenVC: ProfileScreenViewProtocol {
    func dataLoaded() {
        sessionListDelegateAdapter.sessions = presenter.sessions
        sessionListDelegateAdapter.tabelView.reloadData()
    }
    
    func dataRefreshed() {
        sessionListDelegateAdapter.sessions = presenter.sessions
        sessionListDelegateAdapter.tabelView.reloadData()

    }
    
    func showActivityIndicator() {
        self.view.makeToastActivity(.center)
    }
    
    func hideActivityIndicator() {
        refreshControl.isRefreshing ? refreshControl.endRefreshing() : view.hideToastActivity()
    }
    
    func showError(message: String) {
        refreshControl.isRefreshing ? refreshControl.endRefreshing() : hideActivityIndicator()
        self.view.makeToast(message)
    }
    
}
