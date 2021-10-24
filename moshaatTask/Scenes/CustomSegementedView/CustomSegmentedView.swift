//
//  CustomSegmentedView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class CustomSegmentedView: UIControl {
    var selectedSegment = 2
    var buttons = [UIButton]()
    var underline = UIView()
    var titles: String!
    
    func configButtons() {
        let titleArr = titles.components(separatedBy: ",")
        titleArr.forEach { title in
            let button = UIButton(type: .system)
            let attributes: [NSAttributedString.Key: Any] =
                [.foregroundColor: Colors.profileScreenSegmentUnselected.color,
                 .font: Fonts._29LTAzer.medium.font(size: 18)]
            
            let attributedTitle = NSAttributedString(string: title,
                                                     attributes: attributes)
            button.setAttributedTitle(attributedTitle,
                                      for: .normal)
            button.addTarget(self,
                             action: #selector(buttonTapped(button:)),
                             for: .touchUpInside)
            buttons.append(button)
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
        
    func configUnderlineView() {
        let width = self.frame.width / CGFloat(buttons.count)
        let size = CGSize(width: width, height: 2)
        let xPos = self.frame.origin.x + width * CGFloat(2)
        let origin = CGPoint(x: xPos,
                             y: self.bounds.height - 2)
        underline = UIView(frame: .init(origin: origin, size: size))
        underline.backgroundColor = Colors.profileScreenSegmentSelected.color
        
        let btn = buttons.last
        let title = btn?.attributedTitle(for: .normal)?.string ?? ""
        let attributes: [NSAttributedString.Key: Any] =
            [.foregroundColor: Colors.profileScreenSegmentSelected.color,
             .font: Fonts._29LTAzer.medium.font(size: 18)]
        
        let attributedTitle = NSAttributedString(string: title,
                                                 attributes: attributes)
        btn?.setAttributedTitle(attributedTitle,
                                for: .normal)
        self.addSubview(underline)
        underline.clipsToBounds = true
    }
    
    @objc
    func buttonTapped(button: UIButton) {
        buttons.forEach { btn in
            let title = btn.attributedTitle(for: .normal)?.string
            var attributes: [NSAttributedString.Key: Any] =
                [.foregroundColor: Colors.profileScreenSegmentUnselected.color,
                 .font: Fonts._29LTAzer.medium.font(size: 18)]
            if btn == button {
                self.selectedSegment = buttons.firstIndex(of: btn) ?? 2
                UIView.animate(withDuration: 0.5) {
                    self.underline.frame.origin.x = btn.frame.origin.x
                }
                attributes[.foregroundColor] = Colors.profileScreenSegmentSelected.color
            }
            let atrributedTitle = NSAttributedString(string: title ??  "", attributes: attributes)
            btn.setAttributedTitle(atrributedTitle, for: .normal)
        }
        sendActions(for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configView()
    }
    
    private func configView() {
        configButtons()
        stackButtons()
        configUnderlineView()
    }
    
}
