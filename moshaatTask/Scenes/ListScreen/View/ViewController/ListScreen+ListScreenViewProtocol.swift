//
//  ListScreen+ListScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit
import Toast

extension ListScreenVC: ListScreenViewProtocol {
    
    func consultantsLoaded() {
        switch listScreenActions {
        case .refreshConsultants:
            consultantRefreshed()
        default:
            moreConsultantsLoaded()
        }
    }
    
    func consultantRefreshed() {
//        consultantCVAdapter.consultantCV.reloadData()
        consultantCVAdapter.consultants.append(contentsOf: presenter.consultants)
        consultantCVAdapter.refreshConsultantsCV()
    }
    
    func moreConsultantsLoaded() {
        consultantCVAdapter.consultants = presenter.consultants
        consultantCVAdapter.addMoreToConsultantCV()
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
    
}
