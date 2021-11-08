//
//  BookingSheetPresenterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol BookingSheetPresenterProtocol {
    var session: FormattedSession? { get set }
    func viewLoaded()
    func companyButtonTapped()
    func projectButtonTapped()
}
