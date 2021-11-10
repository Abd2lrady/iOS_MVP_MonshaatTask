//
//  BookingSheetVC+BookingSheetViewProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

extension BookingSheetVC: BookingSheetViewProtocol {
    func firmsLoaded() {
        firmCVDelegate.firms = presenter.firms ?? [Firm]()
        firmCVDelegate.collectionView.reloadData()
        firmCVDelegate.collectionView.invalidateIntrinsicContentSize()
        firmCVDelegate.collectionView.layoutSubviews()
    }
    
    func setDate(day: String?) {
        dateLabel.text = day
    }
    
    func setAddress(address: String) {
        addressLabel.text = address
    }
    
    func updateAppointmentCV() {
        appoinmentCVDelegate.schedules = presenter?.session?.schedules
        appointmentCV.reloadData()
    }

}
