//
//  ConsultantCVAdapter+UICollectionViewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ConsultantCVAdapter: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let dragOffestY = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let consultantCVheight = scrollView.frame.size.height
        
        if dragOffestY > (totalContentHeight - consultantCVheight) {
            view?.loadMore()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let trans = scrollView.panGestureRecognizer.translation(in: scrollView.superview).y
        view?.startScrolling(trans: trans)
    }
       
}
