//
//  AppointmentDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class AppointmentDelegateAdapter: NSObject {
    var schedules: [FormattedSchedule]?
    var selected = 0
    weak var appoinmentView: AppointmentProtocol?
    
    init(appoinmentView: AppointmentProtocol) {
        self.appoinmentView = appoinmentView
    }
}
