//
//  ListScreen+ListScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import MBProgressHUD
import Toast

extension ListScreenVC: ListScreenViewProtocol {
    
    func consultantsLoaded() {
        consultantCVAdapter.consultants = presenter.consultants
        consultantCVAdapter.updateConsultantCV()
        self.hideActivityIndicator()
    }
    
    func consultantRefreshed() {
        if consultantCVAdapter.consultants.isEmpty {
            consultantCVAdapter.consultants.append(contentsOf: presenter.consultants)
        } else {
            consultantCVAdapter.consultants = []
            consultantCVAdapter.consultants.append(contentsOf: presenter.consultants)
        }
        consultantCVAdapter.updateConsultantCV()
        self.hideActivityIndicator()
    }
    
    func moreConsultantsLoaded() {
        consultantCVAdapter.consultants.append(contentsOf: presenter.consultants)
        consultantCVAdapter.updateConsultantCV()
        self.hideActivityIndicator()
    }
    
    func showActivityIndicator() {
        self.view.makeToastActivity(.center)
    }
    
    func hideActivityIndicator() {
        refreshControl.isRefreshing ? refreshControl.endRefreshing() : view.hideToastActivity()
//        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showError(message: String) {
        refreshControl.isRefreshing ? refreshControl.endRefreshing() : hideActivityIndicator()
        self.view.makeToast(message)
    }
    
    func noMoreConsultants() {
        print("no more consultants")
        self.hideActivityIndicator()
    }
}
