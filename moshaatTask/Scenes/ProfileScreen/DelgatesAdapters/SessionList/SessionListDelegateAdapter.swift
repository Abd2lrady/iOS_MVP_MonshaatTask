//
//  SessionListDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionListDelegateAdapter: NSObject {
    var sessions: [Session]?
    var bookSession: ((Session?) -> Void)?
    var noMoreSession = false
    var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "ar")
        formater.dateFormat = "EEEE ،d MMM"
        return formater
    }()
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
