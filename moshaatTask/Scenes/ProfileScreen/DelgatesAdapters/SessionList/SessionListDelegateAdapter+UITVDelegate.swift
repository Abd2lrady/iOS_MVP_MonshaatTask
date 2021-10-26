//
//  SessionListDelegateAdapter+UITVDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

extension SessionListDelegateAdapter: UITableViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let trans = scrollView.panGestureRecognizer.translation(in: scrollView.superview).y
        view?.startScrolling(trans: trans)
    }

}
