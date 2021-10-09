//
//  UIBarButtonItem+.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension UIBarButtonItem {
    
    static func barButtonWithImage(img: UIImage) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(img, for: .normal)
        return UIBarButtonItem(customView: button)
    }
    
}
