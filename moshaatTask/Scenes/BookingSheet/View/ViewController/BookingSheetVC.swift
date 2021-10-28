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
            onlineButton.shapeAllCorners(with: onlineButton.bounds.height / 2)
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
            locationButton.shapeAllCorners(with: locationButton.bounds.height / 2)
        }
    }
    @IBOutlet private weak var contactLabel: UILabel! {
        didSet {
            contactLabel.textColor = Colors.profileScreenNameLabel.color
            contactLabel.font = Fonts._29LTAzer.medium.font(size: 16)
            contactLabel.text = Strings.BookingScreen.contactMethod
        }
    }
    
    @IBOutlet private weak var companyCV: UICollectionView! {
        didSet {
            companyCV.backgroundColor = .clear
        }
    }
    @IBOutlet private weak var companyChoose: UILabel! {
        didSet {
            companyChoose.textColor = Colors.profileScreenNameLabel.color
            companyChoose.font = Fonts._29LTAzer.medium.font(size: 16)
            companyChoose.text = Strings.BookingScreen.chooseCompany
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
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.shapeSpecificCorners(with: 25,
                                               corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        }
    }
    @IBOutlet private weak var containerBottomConstrain: NSLayoutConstraint!
    
    var presenter: BookingSheetPresenterProtocol?
    var formatter: DateFormatter = {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "ar")
        formater.dateFormat = "EEEE ،d MMM"
        return formater
    }()
    lazy var appoinmentCVDelegate = AppointmentDelegateAdapter(appoinmentView: self)
    
    weak var bookingSheetCoordinatorDelegate: BookingSheetCoordinatorDelegateProtocol?
    override func viewDidLayoutSubviews() {
        confirmBookingButton.shapeAllCorners(with: confirmBookingButton.bounds.height / 2)
        _appointmentCV.invalidateIntrinsicContentSize()
        appointmentCVHeight.constant = _appointmentCV.contentSize.height
        self.containerBottomConstrain.constant = containerView.frame.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.viewLoaded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateContainer()
    }
    
    private func animateContainer() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0.6
            self.containerBottomConstrain.constant = 0
            self.view.layoutSubviews()
        }
    }
    
    @IBAction func blurViewTapped(_ sender: UITapGestureRecognizer) {
        // hide then dismiss
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0
            self.containerBottomConstrain.constant = self.containerView.bounds.height
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
    
}

extension BookingSheetVC: AppointmentProtocol {
    
}
