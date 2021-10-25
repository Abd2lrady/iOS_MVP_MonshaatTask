//
//  ProfileScreenPresenter+ProfileScreenPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

extension ProfileScreenPresenter: ProfileScreenPresenterProtocol {
    
    func viewLoaded() {
        sessionsInteractor.getSessions(id: id, page: page) { [weak self] response, error in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }
            self?.view?.hideNoInternet()
            self?.view?.showActivityIndicator()
            guard let response = response else {
                self?.view?.showError(message: error?.localizedDescription ?? "error")
                return }
            self?.sessions = response.data ?? [Session]()
            self?.totalPages = response.pagination?.totalPages ?? 1
            self?.view?.hideActivityIndicator()
            self?.view?.dataLoaded()
        }
        
    }
    
    func refreshProfileData() {
        
    }
    
}
