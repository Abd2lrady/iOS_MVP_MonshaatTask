//
//  ProfileScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

class ProfileScreenPresenter {
    weak var view: ProfileScreenViewProtocol?
    let consultant: Consultant
    var currentPage = 1
    var totalPages = 1
    var sessions = [Session]()
    var info: Info?
    let sessionsInteractor = SessionsInteractor()
    let infoInteractor = InfoInteractor()

    init(view: ProfileScreenViewProtocol, consultant: Consultant) {
        self.view = view
        self.consultant = consultant
    }
    
    func getSessions(id: String, page: Int) {
        sessionsInteractor.getSessions(id: id, page: page) { [weak self] response, error in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }
            self?.view?.hideNoInternet()
            guard let response = response else {
                self?.view?.showError(message: error?.localizedDescription ?? "error")
                return }
            self?.sessions = response.data ?? [Session]()
            self?.totalPages = response.pagination?.totalPages ?? 1
            self?.view?.hideActivityIndicator()
            self?.view?.sessionsDataLoaded()
        }
    }
    
    func getInfo(id: String) {
        infoInteractor.getInfo(id:id) {[weak self] response, error in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }
            self?.view?.hideNoInternet()
            guard let response = response else {
                self?.view?.showError(message: error?.localizedDescription ?? "error")
                return }
            self?.info = response.data
            self?.view?.hideActivityIndicator()
            self?.view?.infoDataLoaded()
        }
    }
    func configHeaderView() {
        view?.headerView?.setName(with: consultant.ssoUser?.fullName ?? "no name")
        view?.headerView?.setRate(with: consultant.rating ?? 0)
        view?.headerView?.setInterests(with: consultant.interests ?? [""])
        view?.headerView?.setSpeciality(with: consultant.subject?.title ?? "")
        view?.headerView?.setProfileImg(with: consultant.file?.path ?? "")
    }
    
}
