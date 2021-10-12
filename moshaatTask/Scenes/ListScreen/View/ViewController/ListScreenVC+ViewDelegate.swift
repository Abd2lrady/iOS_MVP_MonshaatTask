//
//  viewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ListScreenVC: ViewDelegate {
   
    func loadMore() {
        self.view.makeToastActivity(.bottom)
        presenter.loadMoreConsultants()
    }
}
