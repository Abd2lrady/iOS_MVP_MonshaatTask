//
//  ProfileScreenCoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation

protocol ProfileScreenCoordinatorProtocol: AnyObject {
    func bookButtonTapped(with session: FormattedSession?, selectedAppointment: Int)
    func backButtonTapped()
}
