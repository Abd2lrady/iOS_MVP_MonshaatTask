//
//  ProfileScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ProfileScreenPresenter {
    weak var view: ProfileScreenViewProtocol?
    let consultant: Consultant
    var page = 1
    var totalPages = 1
    var sessions = [Session]()
    let sessionsInteractor = SessionsInteractor()

    init(view: ProfileScreenViewProtocol, consultant: Consultant) {
        self.view = view
        self.consultant = consultant
    }
    
    func configHeaderView() {
        view?.headerView?.setName(with: consultant.ssoUser?.fullName ?? "no name")
        view?.headerView?.setRate(with: consultant.rating ?? 0)
        view?.headerView?.setInterests(with: consultant.interests ?? [""])
        view?.headerView?.setSpeciality(with: consultant.subject?.title ?? "")
        view?.headerView?.setProfileImg(with: consultant.file?.path ?? "")
    }
}
