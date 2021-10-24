//
//  SessionCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionCell: UITableViewCell {
    static let reuseID = "\(SessionCell.self)"
    
    @IBOutlet private weak var backView: UIView! {
        didSet {
            backView.shapeAllCorners(with: 16)
        }
    }
    @IBOutlet private weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = Fonts._29LTAzer.medium.font(size: 19)
            dateLabel.textColor = Colors.profileScreenSessionDate.color
        }
    }
    @IBOutlet private weak var bookButton: UIButton! {
        didSet {
            bookButton.backgroundColor = Colors.profileScreenBookButton.color
            let attributes: [NSAttributedString.Key: Any] =
                [.font: Fonts._29LTAzer.medium.font(size: 16),
                 .foregroundColor: Colors.profileScreenBookButtonLabel.color]
            let title = NSAttributedString(string: Strings.ProfileScreen.SessionsList.book,
                                           attributes: attributes)
            bookButton.setAttributedTitle(title, for: .normal)
            bookButton.shapeAllCorners(with: bookButton.bounds.height / 2)
        }
    }
    @IBOutlet private weak var addtionalSessionsLabel: UILabel! {
        didSet {
            addtionalSessionsLabel.isHidden = true
            addtionalSessionsLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            addtionalSessionsLabel.textColor = Colors.profileScreenBookButton.color
        }
    }
    @IBOutlet private weak var _appoinmentCV: UICollectionView! {
        didSet {
            appoinmentCV.isScrollEnabled = false
            appoinmentCV.backgroundColor = .clear
            let cellNib = UINib(nibName: "\(SessionAppointmentCell.self)",
                                bundle: .main)
            appoinmentCV.register(cellNib,
                                  forCellWithReuseIdentifier: SessionAppointmentCell.reuseID)
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
    
    func setDate(with label: String) {
        dateLabel.text = label
    }
    
    func setAddtionalAppoinments(with label: String) {
        addtionalSessionsLabel.isHidden = false
        addtionalSessionsLabel.text = label
    }
    
    var appoinmentCV: UICollectionView {
        get {
            return _appoinmentCV
        } set {
            _appoinmentCV = newValue
        }
    }
}
