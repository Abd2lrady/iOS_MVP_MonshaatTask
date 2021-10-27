//
//  viewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

protocol ViewDelegate: AnyObject {
    var scrollableView: UIScrollView { get }
    func goToConsultantProfile(consultant: Consultant)
    func loadMore()
    func startScrolling(trans: CGFloat)
}
