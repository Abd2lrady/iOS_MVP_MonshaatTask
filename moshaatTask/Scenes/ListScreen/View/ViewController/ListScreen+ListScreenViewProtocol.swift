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
    }
    
    func showActivityIndicator() {
        self.view.makeToastActivity(.center)
    }
    
    func hideActivityIndicator() {
        self.view.hideToastActivity()
//        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showError(message: String) {
        self.view.makeToast(message)
    }
    
}
