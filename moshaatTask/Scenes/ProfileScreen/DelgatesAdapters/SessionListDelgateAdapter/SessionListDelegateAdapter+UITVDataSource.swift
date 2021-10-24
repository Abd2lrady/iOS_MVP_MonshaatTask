//
//  SessionListDelegateAdapter+UITVDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension SessionListDelegateAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SessionCell.reuseID,
                                                       for: indexPath) as? SessionCell
        else {fatalError("can`t deque Session cell")}
        return cell
    }
    
}
