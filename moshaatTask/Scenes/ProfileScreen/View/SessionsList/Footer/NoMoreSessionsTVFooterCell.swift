//
//  NoMoreSessionsTVFooterCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

class NoMoreSessionsTVFooterCell: UITableViewCell {
    @IBOutlet private weak var noMoreSessionsLabel: UILabel! {
        didSet {
//            Strings.noOtherResulrs
            noMoreSessionsLabel.text = ""
            noMoreSessionsLabel.font = Fonts._29LTAzer.medium.font(size: 20)
            noMoreSessionsLabel.textColor = .black
            noMoreSessionsLabel.textAlignment = .center
        }
    }
    
    static let reuseID = "NoMoreSessionsTVFooterCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setFooterLabel(with label: String) {
        noMoreSessionsLabel.text = label
    }
}
