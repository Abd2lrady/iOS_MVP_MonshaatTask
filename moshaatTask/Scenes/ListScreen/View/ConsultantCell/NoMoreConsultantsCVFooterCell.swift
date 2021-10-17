//
//  NoMoreConsultantsCVFooterCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady on 17/10/2021.
//

import UIKit

class NoMoreConsultantsCVFooterCell: UICollectionReusableView {
    static let reuseID = "\(NoMoreConsultantsCVFooterCell.self)"
    @IBOutlet weak var noMoreLabel: UILabel! {
        didSet {
            noMoreLabel.font = UIFont(font: Fonts._29LTAzer.medium, size: 20)
            noMoreLabel.textColor = .black
            noMoreLabel.textAlignment = .center
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
