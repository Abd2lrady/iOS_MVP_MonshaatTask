//
//  BookingSheetVC.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class BookingSheetVC: UIViewController {

    @IBOutlet private weak var confirmBookingButton: UIButton! {
        didSet {
            confirmBookingButton.backgroundColor = Colors.profileScreenBookButton.color
            let attributes: [NSAttributedString.Key: Any] =
                [.font: Fonts._29LTAzer.bold.font(size: 17),
                 .foregroundColor: Colors.profileScreenBookButtonLabel.color]
            
            let title = NSAttributedString(string: Strings.BookingScreen.confirmBooking,
                                           attributes: attributes)
            confirmBookingButton.setAttributedTitle(title, for: .normal)
        }
    }
    @IBOutlet private weak var _addressLabel: UILabel!
    @IBOutlet private weak var onlineButton: UIButton! {
        didSet {
            let view = CustomButtonView(frame: onlineButton.bounds)
            onlineButton.addSubview(view)
            view.isUserInteractionEnabled = false
            view.img = Assets.icVideoCamera.image
            view.titleLabel.text = Strings.BookingScreen.onlineMethod
            view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            view.titleLabel.textColor = Colors.bookingSheetContantUnselectedButtons.color
            view.backgroundColor = Colors.bookingSheetContantSelectedButtons.color
            view.shapeAllCorners(with: view.bounds.height / 2)
            onlineButton.layer.shadowRadius = 8
            onlineButton.layer.shadowOpacity = 0.5
            onlineButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            onlineButton.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor

        }
    }
    @IBOutlet private weak var locationButton: UIButton! {
        didSet {
            let view = CustomButtonView(frame: locationButton.bounds)
            locationButton.addSubview(view)
            view.isUserInteractionEnabled = false
            view.img = Assets.icLocation.image
            view.titleLabel.text = Strings.BookingScreen.locationMethod
            view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            view.titleLabel.textColor = Colors.bookingSheetContantUnselectedButtons.color
            view.backgroundColor = Colors.bookingSheetContantSelectedButtons.color
            view.shapeAllCorners(with: view.bounds.height / 2)
            locationButton.layer.shadowRadius = 8
            locationButton.layer.shadowOpacity = 0.5
            locationButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            locationButton.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor
            
        }
    }
    @IBOutlet private weak var contactLabel: UILabel! {
        didSet {
            contactLabel.textColor = Colors.profileScreenNameLabel.color
            contactLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            contactLabel.text = Strings.BookingScreen.contactMethod
        }
    }
    
    @IBOutlet private weak var firmCV: UICollectionView! {
        didSet {
            firmCVConfig()
        }
    }
    @IBOutlet private weak var firmCVHeight: NSLayoutConstraint!
    
    @IBOutlet private weak var firmChoose: UILabel! {
        didSet {
            firmChoose.textColor = Colors.profileScreenNameLabel.color
            firmChoose.font = Fonts._29LTAzer.medium.font(size: 16)
            firmChoose.text = Strings.BookingScreen.chooseFirm
        }
    }
    @IBOutlet private weak var companyButton: UIButton! {
        didSet {
            let view = CustomButtonView(frame: companyButton.bounds)
            companyButton.addSubview(view)
            view.isUserInteractionEnabled = false
            view.img = Assets.icCompany.image
            view.titleLabel.text = Strings.BookingScreen.company
            view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            view.titleLabel.textColor = Colors.bookingSheetContantUnselectedButtons.color
            view.backgroundColor = .white
            view.tag = 66
            view.shapeAllCorners(with: view.bounds.height / 2)
            companyButton.layer.shadowRadius = 8
            companyButton.layer.shadowOpacity = 0.5
            companyButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            companyButton.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor
        }
    }
    
    @IBOutlet private weak var projectButton: UIButton! {
        didSet {
            let view = CustomButtonView(frame: projectButton.bounds)
            projectButton.addSubview(view)
            view.isUserInteractionEnabled = false
            view.img = Assets.icProject.image
            view.titleLabel.text = Strings.BookingScreen.project
            view.titleLabel.font = Fonts._29LTAzer.medium.font(size: 14)
            view.titleLabel.textColor = Colors.bookingSheetContantUnselectedButtons.color
            view.backgroundColor = .white
            view.tag = 55
            view.shapeAllCorners(with: view.bounds.height / 2)
            projectButton.layer.shadowRadius = 8
            projectButton.layer.shadowOpacity = 0.5
            projectButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            projectButton.layer.shadowColor = Colors.bookingSheetButtonShadowColor.color.cgColor
        }
    }
    
    @IBOutlet private weak var _appointmentCV: UICollectionView! {
        didSet {
            conigAppointmentCV()
        }
    }
    @IBOutlet private weak var appointmentCVHeight: NSLayoutConstraint!
    @IBOutlet private weak var chooseTimeLabel: UILabel! {
        didSet {
            chooseTimeLabel.textColor = Colors.profileScreenNameLabel.color
            chooseTimeLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            chooseTimeLabel.text = Strings.BookingScreen.chooseTime
        }
    }
    @IBOutlet private weak var timeZoneLabel: UILabel! {
        didSet {
            timeZoneLabel.textColor = Colors.bookingSheetKSATimeZone.color
            timeZoneLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            timeZoneLabel.text = Strings.BookingScreen.ksaTimeZone
        }
    }
    @IBOutlet private weak var enterEntityTextField: UITextField!
    @IBOutlet private weak var entityLabel: UILabel! {
        didSet {
            entityLabel.textColor = Colors.profileScreenNameLabel.color
            entityLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            entityLabel.text = Strings.BookingScreen.enterEntityHeadLabel
        }
    }
    @IBOutlet private weak var _dateLabel: UILabel! {
        didSet {
            _dateLabel.textColor = Colors.profileScreenNameLabel.color
            _dateLabel.font = Fonts._29LTAzer.medium.font(size: 19)
        }
    }
 
    @IBOutlet private weak var blurView: UIView! {
        didSet {
            blurView.alpha = 0
        }
    }
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.shapeSpecificCorners(with: 25,
                                            corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        }
    }
    
    @IBOutlet private weak var contentViewBottomConstrain: NSLayoutConstraint!
    var presenter: BookingSheetPresenterProtocol!
    var formatter: DateFormatter = {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "ar")
        formater.dateFormat = "EEEE ،d MMM"
        return formater
    }()
    lazy var appoinmentCVDelegate = AppointmentDelegateAdapter(appoinmentView: self)
    lazy var firmCVDelegate = FirmCVDelegateAdapter(collectionView: firmCV)
    let noInternet = NoInternet()
    weak var bookingSheetCoordinatorDelegate: BookingSheetCoordinatorDelegateProtocol?
    
    override func viewDidLayoutSubviews() {
        confirmBookingButton.shapeAllCorners(with: confirmBookingButton.bounds.height / 2)

        scrollView.invalidateIntrinsicContentSize()
        _appointmentCV.invalidateIntrinsicContentSize()
        appointmentCVHeight.constant = _appointmentCV.contentSize.height
        firmCV.invalidateIntrinsicContentSize()
        firmCVHeight.constant = firmCV.contentSize.height
        self.contentViewBottomConstrain.constant = containerView.frame.height
        scrollView.translatesAutoresizingMaskIntoConstraints = true
    }
        
    @IBOutlet weak var firmCVLayout: UICollectionViewFlowLayout! {
        didSet {
            firmCVLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateContainer()
    }
    @IBAction func projectButtonTapped(_ sender: UIButton) {
        noInternet.retryAction = presenter.projectButtonTapped
//        companyButton.backgroundColor = .white
//        projectButton.backgroundColor = Colors.profileScreenListRequestSession.color
        let companyView = companyButton.viewWithTag(66)
        let projectView = projectButton.viewWithTag(55)
        
        companyView?.backgroundColor = .white
        projectView?.backgroundColor = Colors.profileScreenListRequestSession.color
        projectView?.clipsToBounds = true
        presenter?.projectButtonTapped()
    }
    
    @IBAction func companyButtonTapped(_ sender: UIButton) {
        noInternet.retryAction = presenter.companyButtonTapped
//        companyButton.backgroundColor = .white
//        projectButton.backgroundColor = Colors.profileScreenListRequestSession.color
        let companyView = companyButton.viewWithTag(66)
        let projectView = projectButton.viewWithTag(55)
        companyView?.backgroundColor = Colors.profileScreenListRequestSession.color
        companyView?.clipsToBounds = true
        projectView?.backgroundColor = .white
        presenter?.companyButtonTapped()
    }
    
    private func animateContainer() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0.6
            self.contentViewBottomConstrain.constant = 0
            self.view.layoutSubviews()
        }
    }
    
    @IBAction func blurViewTapped(_ sender: UITapGestureRecognizer) {
        // hide then dismiss
        UIView.animate(withDuration: 0.5) {
            self.contentViewBottomConstrain.constant = self.containerView.frame.height
            self.blurView.alpha = 0
            self.view.layoutSubviews()
        } completion: {[weak self]_ in
            self?.bookingSheetCoordinatorDelegate?.dismissTap()
        }
    }
    private func conigAppointmentCV() {
        let cellNib = UINib(nibName: "\(SessionAppointmentCell.self)", bundle: .main)
        _appointmentCV.register(cellNib, forCellWithReuseIdentifier: SessionAppointmentCell.reuseID)
        _appointmentCV.backgroundColor = .clear
        _appointmentCV.semanticContentAttribute = .forceRightToLeft
        _appointmentCV.dataSource = appoinmentCVDelegate
    }
}

extension BookingSheetVC {
    var appointmentCV: UICollectionView {
        get {
            return _appointmentCV
        } set {
            _appointmentCV = newValue
        }
    }
    
    var dateLabel: UILabel {
        get {
            return _dateLabel
        } set {
            _dateLabel = newValue
        }
    }
    
    var addressLabel: UILabel {
        get {
            return _addressLabel
        } set {
            _addressLabel = newValue
        }
    }
    
    func showNoInternet() {
        self.containerView.addSubview(noInternet)
        noInternet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noInternet.topAnchor.constraint(equalTo: containerView.topAnchor),
            noInternet.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            noInternet.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            noInternet.bottomAnchor.constraint(equalTo: blurView.bottomAnchor)
        ])
    }
    
    func hideNoInternet() {
        noInternet.removeFromSuperview()
    }
    
    func firmCVConfig() {
        firmCV.backgroundColor = .clear
        let cellNib = UINib(nibName: "\(FirmCell.self)",
                            bundle: .main)
        firmCV.register(cellNib,
                        forCellWithReuseIdentifier: FirmCell.reuseID)
        firmCV.semanticContentAttribute = .forceRightToLeft
        firmCV.dataSource = firmCVDelegate
        firmCV.delegate = firmCVDelegate
        }

}

extension BookingSheetVC: AppointmentProtocol {
    
}
