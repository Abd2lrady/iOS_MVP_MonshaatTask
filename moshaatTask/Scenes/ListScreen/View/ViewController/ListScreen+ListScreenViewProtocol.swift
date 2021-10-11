//
//  ListScreen+ListScreenViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import MBProgressHUD

extension ListScreenVC: ListScreenViewProtocol {
    func consultantsLoaded() {
        consultantCVAdapter.consultants = presenter.consultants
        consultantCVAdapter.updateConsultantCV()
    }
    
    func showActivityIndicator() {
        let loading = MBProgressHUD.showAdded(to: self.view, animated: true)
        loading.contentColor = Colors.headerBullet.color
        loading.bezelView.style = .solidColor

        loading.bezelView.shapeAllCorners(with: 20)
        loading.bezelView.clipsToBounds = true
        loading.bezelView.backgroundColor = UIColor.lightGray
        loading.label.text = "Loading..."
    }
    
    func hideActivityIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}
