//
//  SessionListDelegateAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class SessionListDelegateAdapter: NSObject {
    var sessions: [Session]?
    var scrollableView: UIScrollView?
    
    var view: ViewDelegate
    
    init(view: ViewDelegate) {
        self.view = view
    }
}
