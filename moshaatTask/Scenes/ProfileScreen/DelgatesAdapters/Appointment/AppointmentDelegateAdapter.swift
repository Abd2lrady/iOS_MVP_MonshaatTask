//
//  AppointmentDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class AppointmentDelegateAdapter: NSObject {
    var times: [Schedule]?
    weak var cell: UITableViewCell?
    var timeFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "h:mm a"
        return formater
    }()
    
    init(cell: UITableViewCell) {
        self.cell = cell
    }
}
