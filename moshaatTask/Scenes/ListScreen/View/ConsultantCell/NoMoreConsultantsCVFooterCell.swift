//
//  NoMoreConsultantsCVFooterCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady on 17/10/2021.
//

import UIKit

class NoMoreConsultantsCVFooterCell: UICollectionReusableView {
    static let reuseID = "\(NoMoreConsultantsCVFooterCell.self)"
    @IBOutlet private weak var _noMoreLabel: UILabel! {
        didSet {
            noMoreLabel.font = Fonts._29LTAzer.medium.font(size: 20)
            noMoreLabel.textColor = .black
            noMoreLabel.textAlignment = .center
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var noMoreLabel: UILabel {
        get {
            return _noMoreLabel
        } set {
            _noMoreLabel = newValue
        }
    }

}
