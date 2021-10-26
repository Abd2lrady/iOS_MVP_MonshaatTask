//
//  InterestsDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class InterestsDelegateAdapter: NSObject {
    var interests: [String]?
    var collectionView: UICollectionView?
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}
