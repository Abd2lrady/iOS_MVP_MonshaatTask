//
//  AppointmentDelegateAdapter+AppooinmentCVDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppointmentDelegateAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        guard appoinmentView as? SessionCell != nil else {
            return schedules?.count ?? 0
        }
        if let schedulesCount = schedules?.count {
            return schedulesCount > 3 ? 3 : schedulesCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SessionAppointmentCell.self)",
                                                            for: indexPath)
                as? SessionAppointmentCell else { fatalError("can`t find dequeue appoinment cell") }
        let time = schedules?[indexPath.row].startHour
            cell.setAppoinment(with: time ?? "")
        return cell
    }
    
}
