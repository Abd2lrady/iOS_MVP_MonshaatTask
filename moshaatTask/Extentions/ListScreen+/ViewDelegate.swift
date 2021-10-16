//
//  viewDelegate.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

protocol ViewDelegate: AnyObject {
    var scrollableView: UIScrollView { get }
    func loadMore()
    func startScrolling()
}
