//
//  InterestsDelegateDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension InterestsDelegateAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return interests?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SessionAppointmentCell.reuseID,
                                                            for: indexPath) as? SessionAppointmentCell
        else { fatalError("can not dequeue interests cell") }
        let interest = interests?[indexPath.row]
        cell.setAppoinment(with: interest ?? "")
        return cell
    }
}
