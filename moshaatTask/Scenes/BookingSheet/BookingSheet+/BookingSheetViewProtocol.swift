//
//  BookingSheetViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

protocol BookingSheetViewProtocol: AnyObject {
    var dateLabel: UILabel { get set }
    var appointmentCV: UICollectionView { get set }
    func updateAppointmentCV()
    func setDate(day: String?)
    func setAddress(address: String)
    func hideNoInternet()
    func showNoInternet()
}
