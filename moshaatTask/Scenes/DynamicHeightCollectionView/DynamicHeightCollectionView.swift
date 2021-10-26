//
//  DynamicHeightCollectionView.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
