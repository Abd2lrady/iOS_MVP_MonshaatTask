//
//  AppointmentDelegateAdapter- UICollectionViewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppointmentDelegateAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = indexPath.row
    }
}
