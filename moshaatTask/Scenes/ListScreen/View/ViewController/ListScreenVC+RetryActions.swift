//
//  ListScreenVC+RetryActions.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

enum RetryActions {
    case viewLoaded
    case refreshConsultants
    case loadMoreConsultants
}

extension ListScreenVC {

    @objc
    func retryAction() {
        switch retryActions {
        case .loadMoreConsultants:
            presenter.loadMoreConsultants()
        case .refreshConsultants:
            presenter.refreshConsultantData()
        case .viewLoaded:
            presenter.viewLoaded()
        case nil:
            fatalError("unknown retry action")
        }
    }
}
