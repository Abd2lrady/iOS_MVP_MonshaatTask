//
//  HeaderCardView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit
import Cosmos
import Kingfisher

class HeaderCardView: UIView {
    
    @IBOutlet private weak var profileImg: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = Fonts._29LTAzer.bold.font(size: 18)
            nameLabel.textColor = Colors.profileScreenNameLabel.color
        }
    }
    @IBOutlet private weak var ratingView: CosmosView!
    @IBOutlet private weak var ratingLabel: UILabel! {
        didSet {
            ratingLabel.font = Fonts._29LTAzer.medium.font(size: 13)
            ratingLabel.textColor = Colors.profileScreenRateLabel.color
        }
    }
    @IBOutlet private weak var interestLabel: UILabel! {
        didSet {
            interestLabel.font = Fonts._29LTAzer.medium.font(size: 23)
            interestLabel.textColor = Colors.profileScreenInterestLabel.color
        }
    }
    @IBOutlet private weak var specialityLabel: UILabel! {
        didSet {
            specialityLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            specialityLabel.textColor = Colors.profileScreenSpecialityLabel.color
        }
    }
    @IBOutlet private weak var sendMsgButton: UIButton! {
        didSet {
            configSendMsgButtonUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
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
        
        let nib = UINib(nibName: "\(HeaderCardView.self)", bundle: Bundle.main)
        let views = nib.instantiate(withOwner: self)
        guard let headerCard = views[0] as? UIView
        else { fatalError("can`t load view from nib \(HeaderCardView.self)") }
        
        self.addSubview(headerCard)
        self.clipsToBounds = true
        
        headerCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([headerCard.topAnchor.constraint(equalTo: self.topAnchor),
                                     headerCard.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     headerCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     headerCard.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                                    ])
    }
    
    func setProfileImg(with path: String) {
        profileImg.kf.setImage(with: URL(string: path),
                               placeholder: Assets.icAvatar.image,
                               options: nil,
                               completionHandler: nil)
    }
    
    func setName(with label: String) {
        nameLabel.text = label
    }
    
    func setRate(with rate: Double) {
        ratingView.rating = rate
        ratingLabel.text = String(rate)
    }
    
    func setSpeciality(with label: String) {
        specialityLabel.text = label
    }
    
    func setInterests(with interests: [String]) {
        var label = ""
        let seprator = [", ", ""]
        for (index, interest) in interests.enumerated() {
            label += "\(interest)"
            label += seprator[index + 1 == interests.count ? 1:0]
        }
        interestLabel.text = label
    }
    
    private func configSendMsgButtonUI() {
        let view = CustomButtonView(frame: sendMsgButton.bounds)
        sendMsgButton.addSubview(view)
        view.isUserInteractionEnabled = false
        view.img = Assets.icChat.image
        view.titleLabel.text = Strings.ProfileScreen.SendMsgButton.title
        view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 13)
        view.titleLabel.textColor = Colors.profileScreenSendMsgButton.color

        sendMsgButton.shapeAllCorners(with: sendMsgButton.bounds.height / 2)
        sendMsgButton.setBorders(with: 2, color: Colors.profileScreenSendMsgButton.color)
    }
    
}
