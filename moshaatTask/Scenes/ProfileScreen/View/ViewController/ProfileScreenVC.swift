//
//  ProfileScreenVC.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ProfileScreenVC: UIViewController {
    
    @IBOutlet private weak var headerCardView: HeaderCardView!
    @IBOutlet weak var segemetedView: CustomSegmentedView!{
        didSet {
            segemetedView.titles = Strings.ProfileScreen.SessionsListHeader.tags
        }
    }
    @IBOutlet weak var consultantInfoTV: UITableView! {
        didSet {
            consultantInfoTV.backgroundColor = .clear
        }
    }
    @IBOutlet weak var sessionListHeaderHeight: NSLayoutConstraint!
    var presenter: ProfileScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = Colors.profileScreenBackground.color
        configNavBar()
        headerCardView.shapeAllCorners(with: 12)
    }
    
    func configNavBar() {
        self.hideNavigationBar()
        let backItem = UIBarButtonItem.barButtonWithImage(img: Assets.icBackArrow.image)
        self.navigationItem.rightBarButtonItem = backItem
        let rightItem = UIBarButtonItem.barButtonWithImage(img: Assets.icSearch.image)
        self.navigationItem.leftBarButtonItem = rightItem
    }
    
}
