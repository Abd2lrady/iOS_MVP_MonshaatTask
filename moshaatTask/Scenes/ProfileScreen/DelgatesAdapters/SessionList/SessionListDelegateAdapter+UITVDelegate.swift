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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let dragOffestY = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let consultantCVheight = scrollView.frame.size.height
        
        if dragOffestY > (totalContentHeight - consultantCVheight) {
            view?.loadMore()
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: NoMoreSessionsTVFooterCell.reuseID)
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if noMoreSession {
            return 50
        }
        return 0
    }

}
