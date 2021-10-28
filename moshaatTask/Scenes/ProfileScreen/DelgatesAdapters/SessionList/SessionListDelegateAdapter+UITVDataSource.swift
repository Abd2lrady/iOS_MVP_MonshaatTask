//
//  SessionListDelegateAdapter+UITVDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension SessionListDelegateAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SessionCell.reuseID,
                                                       for: indexPath) as? SessionCell
        else { fatalError("can`t deque Session cell") }
        let day = sessions?[indexPath.row].day
        let schedules = sessions?[indexPath.row].schedules
        if let hoursCount = sessions?[indexPath.row].schedules?.count {
            if hoursCount > 3 {
                let additional = hoursCount - 3
                let formater = NumberFormatter()
                formater.locale = Locale(identifier: "ar")
                let number = formater.string(from: NSNumber(integerLiteral: additional))
                let label = "+ \(number ?? "") مواعيد متاحة"
                cell.setAddtionalAppoinments(with: label)
            }
            
        }
        cell.setDate(with: day ?? "")
        cell.appoinmentDelegate.schedules = schedules
        cell.bookAction = { [weak self] selected in
            self?.bookSession?(selected, self?.sessions?[indexPath.row])
        }
        return cell
    }
        
}
