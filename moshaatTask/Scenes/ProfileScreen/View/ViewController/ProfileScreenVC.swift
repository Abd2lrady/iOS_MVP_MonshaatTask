//
//  ProfileScreenVC.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ProfileScreenVC: UIViewController {
    
    var presenter: ProfileScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configNavBar()
    }
    
    func configNavBar() {
        self.hideNavigationBar()
        let backItem = UIBarButtonItem.barButtonWithImage(img: Assets.icBackArrow.image)
        self.navigationItem.rightBarButtonItem = backItem
        let rightItem = UIBarButtonItem.barButtonWithImage(img: Assets.icSearch.image)
        self.navigationItem.leftBarButtonItem = rightItem
    }
}
