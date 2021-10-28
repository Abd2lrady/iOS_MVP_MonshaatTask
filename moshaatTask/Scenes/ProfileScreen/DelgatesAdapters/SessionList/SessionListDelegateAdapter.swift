//
//  SessionListDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionListDelegateAdapter: NSObject {
    var sessions: [FormattedSession]?
    var bookSession: ((Int, FormattedSession?) -> Void)?
    var noMoreSession = false
    
    weak var view: ViewDelegate?

    lazy var tabelView: UITableView = {
        guard let tableView = view?.scrollableView as? UITableView
        else { fatalError("no table view") }
        return tableView
    }()

    init(view: ViewDelegate) {
        self.view = view
    }

}
