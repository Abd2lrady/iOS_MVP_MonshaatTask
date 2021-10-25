//
//  ProfileScreenVC+ProfileScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

extension ProfileScreenVC: ProfileScreenViewProtocol {
    func dataLoaded() {
        sessionListDelegateAdapter.sessions = presenter.sessions
        sessionListDelegateAdapter.tabelView.reloadData()
    }
    
    func dataRefreshed() {
        
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
