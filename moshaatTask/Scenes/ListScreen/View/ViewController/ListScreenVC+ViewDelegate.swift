//
//  viewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ListScreenVC: ViewDelegate {
    func goToConsultantProfile(consultant: Consultant) {
        listCoordinatorDelegate?.consultantSelected(consultant: consultant)
    }
    
   
    func loadMore() {
        self.view.makeToastActivity(.bottom)
        presenter.loadMoreConsultants()
    }
}
