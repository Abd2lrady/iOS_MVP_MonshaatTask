//
//  BookingSheetPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class BookingSheetPresenter {
    var session: FormattedSession?
    weak var view: BookingSheetViewProtocol?
    var selectedAppointment: Int
    init(view: BookingSheetViewProtocol, session: FormattedSession?, selectedAppointment: Int) {
        self.view = view
        self.session = session
        self.selectedAppointment = selectedAppointment
    }
}

extension BookingSheetPresenter: BookingSheetPresenterProtocol {
    
    func viewLoaded() {
        view?.setDate(day: session?.day)
        view?.updateAppointmentCV()
        view?.setAddress(address: session?.schedules?[selectedAppointment].address ?? "not valid address")
    }
    
}
