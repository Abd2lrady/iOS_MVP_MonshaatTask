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
        let day = formateDate(timeStamp: sessions?[indexPath.row].day) ?? ""
        if let sessionCount = sessions?[indexPath.row].schedules?.count {
            if sessionCount > 3 {
                let additional = sessionCount - 3
                let formater = NumberFormatter()
                formater.locale = Locale(identifier: "ar")
                let number = formater.string(from: NSNumber(integerLiteral: additional))
                let label = "+ \(number ?? "") مواعيد متاحة"
                cell.setAddtionalAppoinments(with: label)
            }
            
        }
        cell.appoinmentDelegate.times = sessions?[indexPath.row].schedules
        cell.setDate(with: day)
        cell.bookAction = { [weak self] in
            self?.bookSession?(self?.sessions?[indexPath.row])
//            print(self?.sessions?[indexPath.row])
        }
        return cell
    }
    
//    private func configCell(cell:, session: Session) {
//
//    }
    
    private func formateDate(timeStamp: Int?) -> String? {
        guard let timeStamp = timeStamp else { return nil }
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        return dateFormater.string(from: date)
    }
    
}
