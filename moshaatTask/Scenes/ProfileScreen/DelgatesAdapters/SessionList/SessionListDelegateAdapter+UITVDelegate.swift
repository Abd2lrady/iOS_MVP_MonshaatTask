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

    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableCell(withIdentifier: NoMoreSessionsTVFooterCell.reuseID)
                as? NoMoreSessionsTVFooterCell
        else { fatalError("cant dequeue footer") }
        var label = ""
        if noMoreSession {
            label = Strings.noOtherResulrs
        }
        footer.setFooterLabel(with: label)
        return footer.contentView
    }

}
