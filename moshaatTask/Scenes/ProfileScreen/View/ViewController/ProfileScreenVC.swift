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
            configConsultantInfoTV()
            
        }
    }
    @IBOutlet weak var sessionListHeaderHeight: NSLayoutConstraint!
    @IBOutlet weak var headerCardHeight: NSLayoutConstraint!
    
    var refreshControl: UIRefreshControl = {
            var refresh = UIRefreshControl()
            refresh.tintColor = Colors.activityColor.color
            return refresh
        }()

    var presenter: ProfileScreenPresenterProtocol!
    lazy var sessionListDelegateAdapter = SessionListDelegateAdapter(view: self)

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
    @IBAction func segmentedAction(_ sender: CustomSegmentedView) {
        print(sender.selectedSegment)
    }
    
    func configConsultantInfoTV() {
        let cellNib = UINib(nibName: "\(SessionCell.self)", bundle: .main)
        consultantInfoTV.register(cellNib, forCellReuseIdentifier: SessionCell.reuseID)
        consultantInfoTV.refreshControl = refreshControl
        consultantInfoTV.dataSource = sessionListDelegateAdapter
        consultantInfoTV.delegate = sessionListDelegateAdapter
        consultantInfoTV.backgroundColor = .clear
    }
    
    var scrollableView: UIScrollView {
        return consultantInfoTV
    }
    
    func startScrolling(trans: CGFloat) {
        if trans < 0 {
            headerCardHeight.constant = 125
        } else {
            headerCardHeight.constant = 175
        }
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 2,
                       initialSpringVelocity: 5,
                       options: .curveLinear) {
            self.view.layoutIfNeeded()
        }
        
    }
}
