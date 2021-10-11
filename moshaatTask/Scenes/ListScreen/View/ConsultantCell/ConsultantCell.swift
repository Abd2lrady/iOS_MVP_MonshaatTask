//
//  ConsultantCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit
import Cosmos

class ConsultantCell: UICollectionViewCell {
    @IBOutlet private weak var profileImg: UIImageView!
    @IBOutlet private weak var availabilityView: UIView!
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont(font: Fonts._29LTAzer.medium, size: 20)
            nameLabel.textColor = Colors.specializationLabel.color
        }
    }
    @IBOutlet private weak var rateView: CosmosView!
    @IBOutlet private weak var rateLabel: UILabel! {
        didSet {
            rateLabel.font = UIFont(font: Fonts._29LTAzer.regular, size: 12)
            rateLabel.textColor = Colors.specializationLabel.color
        }
    }
    @IBOutlet private weak var specializationLabel: UILabel! {
        didSet {
            specializationLabel.font = UIFont(font: Fonts._29LTAzer.regular, size: 14)
            specializationLabel.textColor = Colors.nameLabel.color
        }
    }
    @IBOutlet private weak var availablilityLabel: UILabel! {
        didSet {
            availablilityLabel.font = UIFont(font: Fonts._29LTAzer.medium, size: 16)
            availablilityLabel.textColor = Colors.availabilityOnlineLabel.color
        }
    }
    
    static let reuseID = "ConsultantCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configCellUI()
    }
    
    private func configCellUI() {
        contentView.shapeAllCorners(with: 30)
        contentView.clipsToBounds = true
        
        profileImg.shapeAllCorners(with: 10)
        profileImg.clipsToBounds = true

        availabilityView.shapeAllCorners(with: availabilityView.bounds.height / 2)
        availabilityView.setBorders(with: 3, color: Colors.availabilityBorder.color)
        availabilityView.clipsToBounds = true
        
    }
}

extension ConsultantCell: ConsultantCellProtocol {
    
    func setNameLabel(with name: String) {
        nameLabel.text = name
        let font = UIFont(font: Fonts._29LTAzer.regular, size: 12)
        nameLabel.font = font
    }
    
    func setRate(with rate: Double) {
        rateLabel.text = String(rate)
        rateView.rating = 3
    }
    
    func setSpecializationLabel(with specialization: String) {
        specializationLabel.text = specialization
    }
    
    func setAvailiability(with availability: String) {
        availablilityLabel.text = availability
    }
    
    func setAvailbilityView(availability: Bool) {
        
    }
    
}
