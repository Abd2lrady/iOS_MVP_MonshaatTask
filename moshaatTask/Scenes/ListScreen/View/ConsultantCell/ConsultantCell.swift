//
//  ConsultantCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit
import Cosmos
import Kingfisher

class ConsultantCell: UICollectionViewCell {
    @IBOutlet private weak var profileImg: UIImageView!
    @IBOutlet private weak var availabilityView: UIView!
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = Fonts._29LTAzer.medium.font(size: 20)
            nameLabel.textColor = Colors.specializationLabel.color
        }
    }
    @IBOutlet private weak var rateView: CosmosView!
    @IBOutlet private weak var rateLabel: UILabel! {
        didSet {
            rateLabel.font = Fonts._29LTAzer.regular.font(size: 12)
            rateLabel.textColor = Colors.specializationLabel.color
        }
    }
    @IBOutlet private weak var specializationLabel: UILabel! {
        didSet {
            specializationLabel.font = Fonts._29LTAzer.regular.font(size: 14)
            specializationLabel.textColor = Colors.nameLabel.color
        }
    }
    @IBOutlet private weak var availablilityLabel: UILabel! {
        didSet {
            availablilityLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            availablilityLabel.textColor = Colors.availabilityOnlineLabel.color
        }
    }
    
    static let reuseID = "\(ConsultantCell.self)"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configCellUI()
    }
    
    private func configCellUI() {
        contentView.shapeAllCorners(with: 20)
        contentView.clipsToBounds = true
        
        profileImg.shapeAllCorners(with: 10)
        profileImg.clipsToBounds = true

        availabilityView.shapeAllCorners(with: availabilityView.bounds.height / 2)
        availabilityView.setBorders(with: 3, color: Colors.availabilityBorder.color)
        availabilityView.clipsToBounds = true
        
    }
}

extension ConsultantCell: ConsultantCellProtocol {
    
    func setProfileImg(path: String) {
        profileImg.kf.setImage(with: URL(string: path),
                               placeholder: Assets.icAvatar.image,
                               options: nil,
                               completionHandler: nil)
    }
    
    func setNameLabel(with name: String) {
        nameLabel.text = name
    }
    
    func setRate(with rate: Double) {
        rateLabel.text = String(rate)
        rateView.rating = rate
    }
    
    func setSpecializationLabel(with specialization: [String]) {
        var label = ""
        let seprator = [", ", ""]
        for (index, speciality) in specialization.enumerated() {
            label += "\(speciality)"
            label += seprator[index + 1 == specialization.count ? 1:0]
        }
//        let label = specialization.reduce(into: "") { label, speciality in
//            label = "\(speciality), "
//        }
        specializationLabel.text = label
    }
    
    func setAvailiability(with availability: String, color: UIColor) {
        availablilityLabel.text = availability
        availablilityLabel.textColor = color
    }
    
    func setAvailbilityView(with color: UIColor) {
        availabilityView.backgroundColor = color
    }
    
}
