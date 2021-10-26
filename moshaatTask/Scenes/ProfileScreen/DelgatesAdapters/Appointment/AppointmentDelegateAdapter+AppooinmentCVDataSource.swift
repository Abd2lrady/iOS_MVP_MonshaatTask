//
//  AppointmentDelegateAdapter+AppooinmentCVDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppointmentDelegateAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if let timesCount = times?.count {
            return timesCount > 3 ? 3 : timesCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SessionAppointmentCell.self)",
                                                            for: indexPath)
                as? SessionAppointmentCell else { fatalError("can`t find dequeue appoinment cell") }
        let time = formateTime(timeStamp: times?[indexPath.row].startTime) ?? ""
        cell.setAppoinment(with: time)
        return cell
    }
    
    private func formateTime(timeStamp: Int?) -> String? {
        guard let timeStamp = timeStamp else { return nil }
        let time = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        return timeFormater.string(from: time)
    }
}
