//
//  BookingSheetPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class BookingSheetPresenter {
    var session: FormattedSession?
    var companies: [Company]?
    var projects: [Project]?
    weak var view: BookingSheetViewProtocol?
    let bookingInteractor = BookingSheetInteractor()
    var selectedAppointment: Int
    init(view: BookingSheetViewProtocol, session: FormattedSession?, selectedAppointment: Int) {
        self.view = view
        self.session = session
        self.selectedAppointment = selectedAppointment
    }
}

extension BookingSheetPresenter: BookingSheetPresenterProtocol {
    func companyButtonTapped() {
        bookingInteractor.getCompanies { [weak self] serverReponse, _ in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }

            self?.companies = serverReponse?.data
        }
    }
    
    func projectButtonTapped() {
        bookingInteractor.getPorjects { [weak self] serverReponse, _ in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }

            self?.projects = serverReponse?.data
        }
    }
    
    func viewLoaded() {
        view?.setDate(day: session?.day)
        view?.updateAppointmentCV()
        view?.setAddress(address: session?.schedules?[selectedAppointment].address ?? "not valid address")
    }
    
}
