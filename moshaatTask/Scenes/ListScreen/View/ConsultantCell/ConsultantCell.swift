//
//  ConsultantCell.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ConsultantCell: UICollectionViewCell {
    @IBOutlet private weak var profileImg: UIImageView!
    @IBOutlet private weak var availabilityView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var rateView: UIView!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var specializationLabel: UILabel!
    @IBOutlet private weak var availablilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configCellUI()
    }
    
    func setNameLabel(with name: String) {
        nameLabel.text = name
        let font = UIFont(font: Fonts._29LTAzer.regular, size: 12)
        nameLabel.font = font
    }
    
    func setRateLabel(with rate: Double) {
        rateLabel.text = String(rate)
    }
    
    func setSpecializationLabel(with specialization: String) {
        specializationLabel.text = specialization
    }
    
    func setAvailiability(with availability: String) {
        availablilityLabel.text = availability
    }
    
    func setAvailbilityView(availability: Bool) {
        
    }
    
    private func configCellUI() {
        contentView.shapeAllCorners(with: 10)
        contentView.clipsToBounds = true
        
        profileImg.shapeAllCorners(with: 10)
        profileImg.clipsToBounds = true

        availabilityView.shapeAllCorners(with: availabilityView.bounds.height / 2)
        availabilityView.setBorders(with: 3, color: Colors.availabilityBorder.color)
        availabilityView.clipsToBounds = true
    }
}
