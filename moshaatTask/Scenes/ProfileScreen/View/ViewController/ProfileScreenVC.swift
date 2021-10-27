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
    @IBOutlet weak var sessionsListHeader: SessionsListHeader!
    @IBOutlet private weak var aboutView: UIView!
    @IBOutlet weak var consultantSessionsTV: UITableView! {
        didSet {
            configConsultantSessionsTV()
        }
    }
    @IBOutlet private weak var sessionListHeaderHeight: NSLayoutConstraint!
    @IBOutlet private weak var headerCardHeight: NSLayoutConstraint!
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
    
    weak var profileCoordinatorDelegate: ProfileScreenCoordinatorProtocol?

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
    
    @IBOutlet  weak var interestsCV: UICollectionView! {
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
    @IBOutlet weak var noSessionsView: UIView!
    @IBOutlet weak var noSessionsLabel: UILabel! {
        didSet {
            noSessionsLabel.text = Strings.noSessions
            noSessionsLabel.font = Fonts._29LTAzer.bold.font(size: 18)
            noSessionsLabel.textColor = Colors.profileScreenNoSessions.color
        }

    }
    
    var presenter: ProfileScreenPresenterProtocol!
    var noInternet = NoInternet()
    var noSessions = false {
        didSet {
            showSessionsList()
        }
    }
    lazy var interestsCVDelegateAdapter = InterestsDelegateAdapter(collectionView: interestsCV)
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
        let back = UIButton()
        back.setImage(Assets.icBackArrow.image, for: .normal)
        back.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        let backItem = UIBarButtonItem(customView: back)
        self.navigationItem.rightBarButtonItem = backItem

        let rightItem = UIBarButtonItem.barButtonWithImage(img: Assets.icSearch.image)
        self.navigationItem.leftBarButtonItem = rightItem
    }

    private func configConsultantSessionsTV() {
        let cellNib = UINib(nibName: "\(SessionCell.self)", bundle: .main)
        let footerNib = UINib(nibName: "\(NoMoreSessionsTVFooterCell.self)", bundle: .main)
        consultantSessionsTV.register(cellNib, forCellReuseIdentifier: SessionCell.reuseID)
        consultantSessionsTV.register(footerNib, forCellReuseIdentifier: NoMoreSessionsTVFooterCell.reuseID)
        consultantSessionsTV.refreshControl = refreshControl
        consultantSessionsTV.dataSource = sessionListDelegateAdapter
        consultantSessionsTV.delegate = sessionListDelegateAdapter
        sessionListDelegateAdapter.bookSession = { [weak self] session in
            self?.profileCoordinatorDelegate?.bookButtonTapped(with: session)
        }
        consultantSessionsTV.backgroundColor = .clear
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
        sessionListDelegateAdapter.sessions = []
        interestsCVDelegateAdapter.interests = []
        sessionListDelegateAdapter.noMoreSession = false
        presenter.refreshProfileData()
    }
    
    var scrollableView: UIScrollView {
        return consultantSessionsTV
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
        sessionsListHeader?.sessionsLabel(hide: noSessions)
        if noSessions {
            listView.bringSubviewToFront(noSessionsView)
            noSessionsView.isHidden = false
            consultantSessionsTV.isHidden = true
        } else {
            listView.bringSubviewToFront(consultantSessionsTV)
        }
        listView.isHidden = false
        aboutView.isHidden = true
    }
    
    private func showAbout() {
        segmentsContianer.bringSubviewToFront(aboutView)
        listView.isHidden = true
        aboutView.isHidden = false
    }
    
    @objc
    private func backButtonAction() {
        profileCoordinatorDelegate?.backButtonTapped()
    }
}
