//
//  CustomButton.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class CustomButtonView: UIView {
    @IBOutlet private weak var buttonTitleLabel: UILabel!
    @IBOutlet private weak var buttonImg: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "\(CustomButtonView.self)", bundle: .main)
        guard let view = nib.instantiate(withOwner: self).first as? UIView
        else { fatalError("no such nib \(CustomButtonView.self)") }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        
    }
    
    var titleLabel: UILabel {
        get {
            return buttonTitleLabel
        }
        set {
            buttonTitleLabel = newValue
        }
    }
    
    var img: UIImage {
        get {
            return buttonImg.image ?? UIImage()
        }
        set {
            buttonImg.image = newValue
        }
        
    }
    
}
