//
//  FirmCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class FirmCell: UICollectionViewCell {
    static let reuseID = "FirmCell"
    
    @IBOutlet private weak var _containerView: UIView! {
        didSet {
            _containerView.shapeAllCorners(with: _containerView.frame.height / 2)
            contentView.layer.shadowRadius = 2
            contentView.layer.shadowOpacity = 0.4
            contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
            contentView.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor
        }
    }
    @IBOutlet private weak var _firmNameLabel: UILabel! {
        didSet {
            _firmNameLabel.font = Fonts._29LTAzer.regular.font(size: 11)
            _firmNameLabel.textColor = .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            _containerView.backgroundColor =
                isSelected ? Colors.profileScreenListRequestSession.color : .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension FirmCell {
    var containerView: UIView {
        get {
            return _containerView
        } set {
            _containerView = newValue
        }
    }
    
    var firmNameLabel: UILabel {
        get {
            return _firmNameLabel
        } set {
            _firmNameLabel = newValue
        }
    }
}
