//
//  SessionAppointmentCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

class SessionAppointmentCell: UICollectionViewCell {
    static let reuseID = "\(SessionAppointmentCell.self)"
    
    @IBOutlet private weak var appoinmentLabel: UILabel! {
        didSet {
            appoinmentLabel.shapeAllCorners(with: appoinmentLabel.bounds.height / 2)
            appoinmentLabel.setBorders(with: 1, color: Colors.profileScreenBookButton.color)
            appoinmentLabel.font = Fonts._29LTAzer.regular.font(size: 11)
            appoinmentLabel.textColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setAppoinment(with appoinment: String) {
        appoinmentLabel.text = appoinment
    }

}
