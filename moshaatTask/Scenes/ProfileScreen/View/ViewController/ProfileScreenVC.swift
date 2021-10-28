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
    @IBOutlet private weak var _sessionsListHeader: SessionsListHeader!
    @IBOutlet private weak var aboutView: UIView!
    @IBOutlet private weak var _consultantSessionsTV: UITableView! {
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
    
    @IBOutlet private weak var _interestsCV: UICollectionView! {
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
    
    @IBOutlet private weak var _aboutLabel: UILabel! {
        didSet {
            _aboutLabel.font = Fonts._29LTAzer.medium.font(size: 15)
            _aboutLabel.textColor = Colors.profileScreenAboutLabel.color
        }
    }
    @IBOutlet private weak var _noSessionsView: UIView!
    @IBOutlet private weak var _noSessionsLabel: UILabel! {
        didSet {
            _noSessionsLabel.text = Strings.noSessions
            _noSessionsLabel.font = Fonts._29LTAzer.bold.font(size: 18)
            _noSessionsLabel.textColor = Colors.profileScreenNoSessions.color
        }

    }
    
    var presenter: ProfileScreenPresenterProtocol!
    var noInternet = NoInternet()
    var noSessions = false {
        didSet {
            showSessionsList()
        }
    }
    lazy var interestsCVDelegateAdapter = InterestsDelegateAdapter(collectionView: _interestsCV)
    lazy var sessionListDelegateAdapter = SessionListDelegateAdapter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        noInternet.retryAction = presenter.viewLoaded
        presenter.viewLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = Colors.profileScreenBackground.color
        configNavBar()
        headerCardView.shapeAllCorners(with: 12)
        interestsCVHeight.constant = _interestsCV.contentSize.height
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
        _consultantSessionsTV.register(cellNib, forCellReuseIdentifier: SessionCell.reuseID)
        _consultantSessionsTV.register(footerNib, forCellReuseIdentifier: NoMoreSessionsTVFooterCell.reuseID)
        _consultantSessionsTV.refreshControl = refreshControl
        _consultantSessionsTV.dataSource = sessionListDelegateAdapter
        _consultantSessionsTV.delegate = sessionListDelegateAdapter
        sessionListDelegateAdapter.bookSession = { [weak self] selected, session in
            self?.profileCoordinatorDelegate?.bookButtonTapped(with: session, selectedAppointment: selected)
        }
        _consultantSessionsTV.backgroundColor = .clear
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func configConsultantInterestsCV() {
        let cellNib = UINib(nibName: "\(SessionAppointmentCell.self)", bundle: .main)
        _interestsCV.register(cellNib, forCellWithReuseIdentifier: SessionAppointmentCell.reuseID)
        _interestsCV.dataSource = interestsCVDelegateAdapter
        _interestsCV.backgroundColor = .clear
    }
    
    @objc
    func refresh() {
        noInternet.retryAction = presenter.refreshProfileData
        refreshControl.beginRefreshing()
        sessionListDelegateAdapter.sessions = []
        interestsCVDelegateAdapter.interests = []
        sessionListDelegateAdapter.noMoreSession = false
        presenter.refreshProfileData()
    }
    
    var scrollableView: UIScrollView {
        return _consultantSessionsTV
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
        _sessionsListHeader?.sessionsLabel(hide: noSessions)
        if noSessions {
            listView.bringSubviewToFront(_noSessionsView)
            _noSessionsView.isHidden = false
            _consultantSessionsTV.isHidden = true
        } else {
            listView.bringSubviewToFront(_consultantSessionsTV)
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

extension ProfileScreenVC {
    var sessionsListHeader: SessionsListHeader {
        get {
            return _sessionsListHeader
        } set {
            _sessionsListHeader = newValue
        }
    }
    
    var consultantSessionsTV: UITableView {
        get {
            return _consultantSessionsTV
        } set {
            _consultantSessionsTV = newValue
        }
    }
    
    var interestsCV: UICollectionView {
        get {
            return _interestsCV
        } set {
            _interestsCV = newValue
        }
    }
    
    var aboutLabel: UILabel {
        get {
            return _aboutLabel
        } set {
            _aboutLabel = newValue
        }
    }
    
    var noSessionsView: UIView {
        get {
            return _noSessionsView
        } set {
            _noSessionsView = newValue
        }
    }
    
    var noSessionsLabel: UILabel {
        get {
            return _noSessionsLabel
        } set {
            _noSessionsLabel = newValue
        }
    }

}
