//
//  FirmCVDelegateAdapter+DataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension FirmCVDelegateAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return firms?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirmCell.reuseID,
                                                            for: indexPath) as? FirmCell
        else { fatalError("cant`t dequeue firm cell") }
        cell.firmNameLabel.text = firms?[indexPath.row].name
        return cell
    }
}
extension FirmCVDelegateAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        
        label.text = firms?[indexPath.row].name
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 32)

    }
}
