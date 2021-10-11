//
//  ConsultantCellProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

protocol ConsultantCellProtocol {
    
    func setNameLabel(with name: String)
    
    func setRate(with rate: Double)
    
    func setSpecializationLabel(with specialization: [String])
    
    func setAvailiability(with availability: String)
    
    func setAvailbilityView(with color: UIColor)
}
