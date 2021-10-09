//
//  NavigationBar.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension UIViewController {
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.clipsToBounds = true
    }

}
