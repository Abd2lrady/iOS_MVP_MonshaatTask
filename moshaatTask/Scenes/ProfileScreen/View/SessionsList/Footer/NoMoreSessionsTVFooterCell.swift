//
//  NoMoreSessionsTVFooterCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

class NoMoreSessionsTVFooterCell: UITableViewHeaderFooterView {
    @IBOutlet private weak var noMoreSessionsLabel: UILabel! {
        didSet {
            noMoreSessionsLabel.text = Strings.noOtherResulrs
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
}
