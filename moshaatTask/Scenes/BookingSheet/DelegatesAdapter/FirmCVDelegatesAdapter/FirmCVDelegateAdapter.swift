//
//  firmCVDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class FirmCVDelegateAdapter: NSObject {
    var firms: [Firm]?
    
    let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}
