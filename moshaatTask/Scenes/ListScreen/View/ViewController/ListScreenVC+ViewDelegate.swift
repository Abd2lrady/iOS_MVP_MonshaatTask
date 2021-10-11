//
//  viewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ListScreenVC: ViewDelegate {
   
    func loadMore() {
        presenter.loadMoreConsultants()
        
        self.view.makeToastActivity(.bottom)
    }
}
