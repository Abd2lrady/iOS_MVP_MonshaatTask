//
//  SessionAppointmentCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

class SessionAppointmentCell: UICollectionViewCell {
    static let reuseID = "\(SessionAppointmentCell.self)"
    
    @IBOutlet private weak var _containerView: UIView! {
        didSet {
            containerView.shapeAllCorners(with: containerView.bounds.height / 2)
            containerView.setBorders(with: 1, color: Colors.profileScreenBookButton.color)
            containerView.backgroundColor = .white
        }
    }
    @IBOutlet private weak var appoinmentLabel: UILabel! {
        didSet {
            appoinmentLabel.font = Fonts._29LTAzer.regular.font(size: 11)
            appoinmentLabel.textColor = .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            containerView.backgroundColor =
                isSelected ? Colors.profileScreenListRequestSession.color : .white
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

extension SessionAppointmentCell {
    var containerView: UIView {
        get {
            return _containerView
        } set {
            _containerView = newValue
        }
    }
}
