//
//  ProfileScreenVC.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit
import Toast

class ProfileScreenVC: UIViewController {
    
    @IBOutlet private weak var headerBGView: UIImageView!
    @IBOutlet private weak var headerCardView: HeaderCardView!
    @IBOutlet private weak var segemetedView: CustomSegmentedView! {
        didSet {
            segemetedView.titles = Strings.ProfileScreen.SessionsListHeader.tags
        }
    }
    @IBOutlet private weak var consultantInfoTV: UITableView! {
        didSet {
            configConsultantInfoTV()
        }
    }
    @IBOutlet private weak var sessionListHeaderHeight: NSLayoutConstraint!
    @IBOutlet private weak var headerCardHeight: NSLayoutConstraint!
    
    let refreshControl: UIRefreshControl = {
        var refresh = UIRefreshControl()
        refresh.tintColor = Colors.activityColor.color
        return refresh
    }()
    
    let toastActivityStyle: ToastStyle = {
        var style = ToastStyle()
        style.activityBackgroundColor = .clear
        style.maxHeightPercentage = 0.5
        style.activityIndicatorColor = Colors.activityColor.color
        ToastManager.shared.style = style
        return style
    }()

    var presenter: ProfileScreenPresenterProtocol!
    var noInternet = NoInternet()
    lazy var sessionListDelegateAdapter = SessionListDelegateAdapter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
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
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc
    func refresh() {
        refreshControl.beginRefreshing()
        presenter.refreshProfileData()
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
    
    func showNoInternet() {
        self.view.addSubview(noInternet)
        headerCardView.isHidden = true
        headerCardView.isUserInteractionEnabled = false
        noInternet.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                    noInternet.topAnchor.constraint(equalTo: headerBGView.bottomAnchor),
                                    noInternet.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                    noInternet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    noInternet.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                                    ])
//        noInternet.tryAgainButton.addTarget(self,
//                                            action: #selector(),
//                                            for: .touchUpInside)

    }
    
    func hideNoInternet() {
        headerCardView.isHidden = false
        headerCardView.isUserInteractionEnabled = true

        noInternet.removeFromSuperview()
    }
}
