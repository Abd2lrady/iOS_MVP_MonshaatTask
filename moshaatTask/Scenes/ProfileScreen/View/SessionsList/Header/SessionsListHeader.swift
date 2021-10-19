//
//  SessionsListHeader.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionsListHeader: UITableViewCell {

    @IBOutlet private weak var sessionsLabel: UILabel! {
        didSet {
            sessionsLabel.text = Strings.ProfileScreen.SessionsList.sessions
            sessionsLabel.font = Fonts._29LTAzer.bold.font(size: 22)
            sessionsLabel.textColor = Colors.profileScreenListSession.color
        }
    }
    
    @IBOutlet private weak var updateLabel: UILabel! {
        didSet {
            updateLabel.text = Strings.ProfileScreen.SessionsList.update
            updateLabel.font = Fonts._29LTAzer.medium.font(size: 23)
            updateLabel.textColor = Colors.profileScreenListUpdate.color
        }
    }
    
    @IBOutlet private weak var requestSessionButton: UIButton! {
        didSet {
            configRequestSesstionButtonUI()
        }
    }
    
    @IBOutlet private weak var notificationButton: UIButton! {
        didSet {
            notificationButton.setBackgroundImage(Assets.icNotification.image, for: .normal)
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
    
    private func configRequestSesstionButtonUI() {
        let view = CustomButtonView(frame: requestSessionButton.bounds)
        requestSessionButton.addSubview(view)
        view.isUserInteractionEnabled = false
        view.img = Assets.icAdd.image
        view.titleLabel.text = Strings.ProfileScreen.SessionsList.sessionRequest
        view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 16)
        view.titleLabel.textColor = Colors.profileScreenListRequestSession.color
    }
    
}
