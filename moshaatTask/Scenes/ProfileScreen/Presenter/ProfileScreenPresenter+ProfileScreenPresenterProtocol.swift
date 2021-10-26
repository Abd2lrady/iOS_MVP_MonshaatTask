//
//  ProfileScreenPresenter+ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

extension ProfileScreenPresenter: ProfileScreenPresenterProtocol {

    func viewLoaded() {
        configHeaderView()
        sessionsInteractor.getSessions(id: consultant.id ?? "", page: page) { [weak self] response, error in
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
        //        let test = "93f4d920-0720-4a84-8f84-fed97dfa49f2"

        infoInteractor.getInfo(id: consultant.id ?? "") {[weak self] response, error in
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
    
    func refreshProfileData() {
        
    }
    
}
