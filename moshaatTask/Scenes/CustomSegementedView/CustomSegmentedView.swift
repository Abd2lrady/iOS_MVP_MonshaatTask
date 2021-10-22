//
//  CustomSegmentedView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class CustomSegmentedView: UIView {
    var buttons = [UIButton]()
    
    @IBInspectable var titles: String = "" {
        didSet {
            configButtonsTitles()
        }
    }
    
    func configButtonsTitles() {
        clearView()
        let titleArr = titles.components(separatedBy: ",")
        titleArr.forEach { title in
            let button = UIButton(type: .system)
            let attributes: [NSAttributedString.Key: Any] =
                [.foregroundColor: Colors.profileScreenSegmentUnselected.color,
                 .font: Fonts._29LTAzer.medium.font(size: 18)]
            
            let attributedTitle = NSMutableAttributedString(string: title, attributes: attributes)
            button.setAttributedTitle(attributedTitle, for: .normal)
            buttons.append(button)
        }
        stackButtons()
    }
    
    func clearView() {
        buttons.removeAll()
        subviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    func stackButtons() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        configUnderlineView()
        
    }
    
    func configUnderlineView() {
        let size = CGSize(width: self.bounds.width / CGFloat(buttons.count),
                          height: 2)
        let origin = CGPoint(x: self.bounds.minX, y: self.bounds.maxY)
        let underline = UIView(frame: .init(origin: origin, size: size))
        underline.backgroundColor = Colors.profileScreenSegmentSelected.color
        self.addSubview(underline)
    }

}
