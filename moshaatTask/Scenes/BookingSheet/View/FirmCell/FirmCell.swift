//
//  FirmCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class FirmCell: UICollectionViewCell {
    static let reuseID = "FirmCell"
    
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.shapeAllCorners(with: containerView.frame.height / 2)
            contentView.layer.shadowRadius = 2
            contentView.layer.shadowOpacity = 0.4
            contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
            contentView.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor
        }
    }
    @IBOutlet weak var firmNameLabel: UILabel! {
        didSet {
            firmNameLabel.font = Fonts._29LTAzer.regular.font(size: 11)
            firmNameLabel.textColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
