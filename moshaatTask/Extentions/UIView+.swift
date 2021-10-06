//
//  UIView+.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension UIView {
    func shapeCorners(radius: CGFloat,
                      corners: CACornerMask) {
        
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.clipsToBounds = true
        
    }
}
