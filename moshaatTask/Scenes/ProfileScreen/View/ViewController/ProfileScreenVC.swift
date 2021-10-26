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
    @IBOutlet private weak var listView: UIView!
    @IBOutlet private weak var aboutView: UIView!
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

    @IBOutlet private weak var segmentsContianer: UIView! {
        didSet {
            showSessionsList()
        }
    }
    
    @IBOutlet private weak var interestHeadLabel: UILabel! {
        didSet {
            interestHeadLabel.font = Fonts._29LTAzer.medium.font(size: 20)
            interestHeadLabel.textColor = Colors.profileScreenAboutHeaders.color
            interestHeadLabel.text = Strings.ProfileScreen.interestHeader
        }
    }
    
    @IBOutlet private weak var interestsCV: UICollectionView! {
        didSet {
            configConsultantInterestsCV()
        }
    }
    
    @IBOutlet private weak var interestsCVHeight: NSLayoutConstraint!
    
    @IBOutlet private weak var aboutHeadLabel: UILabel! {
        didSet {
            aboutHeadLabel.font = Fonts._29LTAzer.medium.font(size: 20)
            aboutHeadLabel.textColor = Colors.profileScreenAboutHeaders.color
            aboutHeadLabel.text = Strings.ProfileScreen.aboutHeader
        }
    }
    
    @IBOutlet weak var aboutLabel: UILabel! {
        didSet {
            aboutLabel.font = Fonts._29LTAzer.medium.font(size: 15)
            aboutLabel.textColor = Colors.profileScreenAboutLabel.color
        }

    }
    
    var presenter: ProfileScreenPresenterProtocol!
    var noInternet = NoInternet()
    var interestsCVDelegateAdapter = InterestsDelegateAdapter()
    lazy var sessionListDelegateAdapter = SessionListDelegateAdapter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        presenter.viewLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = Colors.profileScreenBackground.color
        configNavBar()
        headerCardView.shapeAllCorners(with: 12)
        interestsCVHeight.constant = interestsCV.contentSize.height
    }
    
    func configNavBar() {
        self.hideNavigationBar()
        let backItem = UIBarButtonItem.barButtonWithImage(img: Assets.icBackArrow.image)
        self.navigationItem.rightBarButtonItem = backItem
        let rightItem = UIBarButtonItem.barButtonWithImage(img: Assets.icSearch.image)
        self.navigationItem.leftBarButtonItem = rightItem
    }
    @IBAction func segmentedAction(_ sender: CustomSegmentedView) {
        switch sender.selectedSegment {
        case 2:
            showSessionsList()
        case 1:
            showAbout()
        default:
            break
        }
        print(sender.selectedSegment)
    }
    
    private func configConsultantInfoTV() {
        let cellNib = UINib(nibName: "\(SessionCell.self)", bundle: .main)
        consultantInfoTV.register(cellNib, forCellReuseIdentifier: SessionCell.reuseID)
        consultantInfoTV.refreshControl = refreshControl
        consultantInfoTV.dataSource = sessionListDelegateAdapter
        consultantInfoTV.delegate = sessionListDelegateAdapter
        consultantInfoTV.backgroundColor = .clear
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func configConsultantInterestsCV() {
        let cellNib = UINib(nibName: "\(SessionAppointmentCell.self)", bundle: .main)
        interestsCV.register(cellNib, forCellWithReuseIdentifier: SessionAppointmentCell.reuseID)
        interestsCV.dataSource = interestsCVDelegateAdapter
        interestsCV.backgroundColor = .clear
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
    
    var headerView: HeaderCardView? {
        get {
            return headerCardView
        }
        set {
            headerCardView = newValue
        }
    }
    
    private func showSessionsList() {
        segmentsContianer.bringSubviewToFront(listView)
        listView.isHidden = false
        aboutView.isHidden = true
    }
    
    private func showAbout() {
        segmentsContianer.bringSubviewToFront(aboutView)
        listView.isHidden = true
        aboutView.isHidden = false

    }

}
