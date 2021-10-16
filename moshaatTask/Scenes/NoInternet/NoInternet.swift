//
//  NoInternet.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class NoInternet: UIView {
    
    @IBOutlet private weak var noInternetImg: UIImageView!
    @IBOutlet weak var tryAgainButton: UIButton! {
        didSet {
            configTryAgainButtonUI()
        }
        
    }
    @IBOutlet private weak var noInternetLabel: UILabel! {
        didSet {
            noInternetLabel.font = UIFont(font: Fonts._29LTAzer.medium, size: 31)
            noInternetLabel.textColor = Colors.noInternetLabel.color
            noInternetLabel.text = Strings.NoInternet.noInternetLabel
        }
    }
    @IBOutlet private weak var checkTryAgainLabel: UILabel! {
        didSet {
            checkTryAgainLabel.font = UIFont(font: Fonts._29LTAzer.regular, size: 18)
            checkTryAgainLabel.textColor = Colors.noInternetLabel.color
            checkTryAgainLabel.text = Strings.NoInternet.checkConnectionLabel
        }
    }
 private   var buttonActionFn: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private  func commonInit() {
        guard let noInternetView = Bundle
                .main
                .loadNibNamed(String(describing: NoInternet.self),
                              owner: self,
                              options: nil)?.first as? UIView
        else { fatalError("no internet view founded") }
        self.addSubview(noInternetView)
        noInternetView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([noInternetView.topAnchor.constraint(equalTo: self.topAnchor),
                                     noInternetView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     noInternetView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     noInternetView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        self.clipsToBounds = true
        
    }
    
    private   func configTryAgainButtonUI() {
        tryAgainButton.backgroundColor = Colors.tryAgainButtonBg.color
        
        let attributes: [NSAttributedString.Key: Any] =
                        [.font: UIFont(font: Fonts._29LTAzer.regular,
                                       size: 17) ?? UIFont.systemFont(ofSize: 17),
                         .foregroundColor: Colors.tryAgainButtonTitle.color]
        
        let title = NSAttributedString(string: Strings.NoInternet.tryAgainButton,
                                       attributes: attributes)
        
        tryAgainButton.setAttributedTitle(title,
                                          for: .normal)
        tryAgainButton.shapeAllCorners(with: tryAgainButton.bounds.height / 2)
    }
    
    @objc
    func buttonAction() {
        buttonActionFn?()
    }
    func addButtonAction(target: UIViewController, action: @escaping() -> Void) {
        buttonActionFn = action
        tryAgainButton.addTarget(target, action: #selector(buttonAction), for: .touchUpInside)
    }
    
}
