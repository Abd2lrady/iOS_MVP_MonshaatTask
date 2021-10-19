//
//  SessionAppointmentCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady on 19/10/2021.
//

import UIKit

class SessionAppointmentCell: UICollectionViewCell {
    static let reuseID = "\(SessionAppointmentCell.self)"
    
    @IBOutlet private weak var appoinmentLabel: UILabel! {
        didSet {
            appoinmentLabel.shapeAllCorners(with: appoinmentLabel.bounds.height / 2)
            appoinmentLabel.setBorders(with: 1, color: Colors.profileScreenBookButton.color)
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
