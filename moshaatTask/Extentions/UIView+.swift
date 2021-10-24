//
//  UIView+.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension UIView {
    func shapeSpecificCorners(with radius: CGFloat,
                              corners: CACornerMask) {
        
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
    }
    
    func shapeAllCorners(with radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBorders(with width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
