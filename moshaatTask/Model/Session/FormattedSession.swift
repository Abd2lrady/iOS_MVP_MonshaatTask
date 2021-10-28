//
//  FormattedSession.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

struct FormattedSession {
    let day: String?
    let schedules: [FormattedSchedule]?
}

struct FormattedSchedule {
    let startHour: String?
    let address: String?
}
