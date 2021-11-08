//
//  firmCVDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class FirmCVDelegateAdapter: NSObject {
    var firms = [Project(name: "saddsa"),
                 Project(name: "saddsa"),
                 Project(name: "nnd"),
                 Project(name: "sadafdsfdsdsdasdsaadsdsa"),
                 Project(name: "saddsadsa")
    ]
    
    let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}
