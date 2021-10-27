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
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var companyButton: UIButton!
    @IBOutlet private weak var locationButton: UIButton!
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
    @IBOutlet private weak var appoinmentCV: UICollectionView! {
        didSet {
            appoinmentCV.backgroundColor = .clear
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
    @IBOutlet private weak var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = Colors.profileScreenNameLabel.color
            dateLabel.font = Fonts._29LTAzer.medium.font(size: 19)
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
    @IBOutlet weak var containerBottomConstrain: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        confirmBookingButton.shapeAllCorners(with: confirmBookingButton.bounds.height / 2)
        appoinmentCV.invalidateIntrinsicContentSize()
        appointmentCVHeight.constant = appoinmentCV.contentSize.height
        self.containerBottomConstrain.constant = containerView.frame.height
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        } completion: {_ in
            self.dismiss(animated: false)
        }
    }
    
}
