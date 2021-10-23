//
//  CustomSegmentedView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class CustomSegmentedView: UIView {
    var buttons = [UIButton]()
    var underline = UIView()
    @IBInspectable var titles: String = "" {
        didSet {
            clearView()
            configButtons()
        }
    }
    
    func configButtons() {
        let titleArr = titles.components(separatedBy: ",")
        titleArr.forEach { title in
            let button = UIButton(type: .custom)
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
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configUnderlineView()
    }
    
    func configUnderlineView() {
        let width = self.bounds.width / CGFloat(buttons.count)
        let size = CGSize(width: width, height: 2)
        let xPos = self.bounds.origin.x
        let origin = CGPoint(x: xPos,
                             y: self.bounds.height - 2)
        underline = UIView(frame: .init(origin: origin, size: size))
        underline.backgroundColor = Colors.profileScreenSegmentSelected.color
        self.addSubview(underline)
//        underline.frame.origin.x = self.bounds.origin.x + (width * CGFloat(2))
    }
}
