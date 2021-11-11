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
        cell.maxWidth.constant = collectionView.bounds.width - 5
        return cell
    }
}
extension FirmCVDelegateAdapter: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirmCell.reuseID,
//                                                            for: indexPath) as? FirmCell
//        else { fatalError("can`t find firm cell") }
//        let label = UILabel()
//        label.text = firms?[indexPath.row].name
//        label.font = cell.firmNameLabel.font
//        label.sizeToFit()
//        if label.bounds.width > collectionView.bounds.width {
//            cell.firmNameLabel.lineBreakMode = .byTruncatingTail
//            return CGSize(width: collectionView.frame.width, height: label.bounds.height)
//        }
//        return CGSize(width: label.frame.width + 10, height: label.bounds.height)
//    }
}
