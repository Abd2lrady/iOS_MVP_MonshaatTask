//
//  ConsultantCVAdapter+UICollectionViewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ConsultantCVAdapter: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
         if showFooter {
            return CGSize(width: 220, height: 75)
         } else {
            return CGSize(width: 220 , height: 0)
         }
    }
}
