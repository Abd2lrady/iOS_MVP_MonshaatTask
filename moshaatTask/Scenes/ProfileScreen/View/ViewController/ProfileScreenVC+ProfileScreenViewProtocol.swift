//
//  ProfileScreenVC+ProfileScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Toast

extension ProfileScreenVC: ProfileScreenViewProtocol {
    
    func sessionsDataLoaded() {
        noSessions = presenter.formattedSessions.isEmpty
        sessionListDelegateAdapter.sessions = presenter.formattedSessions
        sessionListDelegateAdapter.tabelView.reloadData()
    }
    func infoDataLoaded() {
        aboutLabel.text = presenter.info?.aboutMe

        if presenter.info?.aboutMe == nil {
            aboutLabel.text = "لاتوجد معلومات عن المرشد"
        }
        interestsCVDelegateAdapter.interests = presenter.info?.interests
        interestsCVDelegateAdapter.collectionView?.reloadData()
    }
    func dataRefreshed() {
        sessionListDelegateAdapter.sessions?.append(contentsOf: presenter.formattedSessions)
        interestsCVDelegateAdapter.interests?.append(contentsOf: presenter.info?.interests ?? [""])
        sessionListDelegateAdapter.tabelView.reloadData()
        interestsCV.reloadData()
    }
    
    func moreSessionsLoaded() {
        sessionListDelegateAdapter.sessions?.append(contentsOf: presenter.formattedSessions)
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
    
    func noMoreSession() {
        hideActivityIndicator()
        sessionListDelegateAdapter.noMoreSession = true
        consultantSessionsTV.reloadData()
    }
    
}
