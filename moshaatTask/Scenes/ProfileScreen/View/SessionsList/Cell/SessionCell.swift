//
//  SessionCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionCell: UITableViewCell {
    static let reuseID = "\(SessionCell.self)"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var addtionalSessionsLabel: UILabel! {
        addtionalSessionsLabel.isHidden = true
    }
    @IBOutlet weak var sessionsCV: UICollectionView! {
        didSet {
            sessionsCV.isScrollEnabled = false
            sessionsCV.backgroundColor = .clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
