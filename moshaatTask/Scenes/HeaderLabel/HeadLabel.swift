//
//  HeadLabel.swift
//  TaskMVP
//
//  Created by Ahmad Abdulrady on 26/07/2021.
//

import UIKit

class HeadLabel: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet  private weak var headingLabel: UILabel!
    @IBOutlet private weak var bulletView: UIView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setHeaderTitle(with title: String) {
        headingLabel.text = title
    }
    
    func setBulletColor(with color: UIColor) {
        bulletView.backgroundColor = color
    }
}

extension HeadLabel {
    func commonInit() {
        let labelView = Bundle.main.loadNibNamed("HeadLabel",
                                                 owner: self)?.first as? UIView
        labelView?.frame = self.bounds
        self.addSubview(labelView ?? UIView())
        
    }
}
