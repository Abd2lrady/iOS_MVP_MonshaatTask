//
//  SessionsListHeader.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionsListHeader: UIView {

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
            updateLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            updateLabel.textColor = Colors.profileScreenListUpdate.color
        }
    }
    
    @IBOutlet private weak var requestSessionButton: UIButton! {
        didSet {
            configRequestSesstionButtonUI()
            requestSessionButton.shapeAllCorners(with: 9)
        }
    }
    
    @IBOutlet private weak var notificationButton: UIButton! {
        didSet {
            notificationButton.setImage(Assets.icNotification.image, for: .normal)
            notificationButton.backgroundColor = Colors.profileScreenNotificationButtonLabel.color
            notificationButton.shapeAllCorners(with: 9)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "\(SessionsListHeader.self)", bundle: .main)
        guard let view = nib.instantiate(withOwner: self).first as? UIView
        else { fatalError("can`t find view from nib named \(SessionsListHeader.self)") }
        self.addSubview(view)
        self.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    
}
