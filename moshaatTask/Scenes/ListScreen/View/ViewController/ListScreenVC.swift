//
//  ViewController.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady
import Kingfisher
import Toast

import UIKit

class ListScreenVC: UIViewController {
    
    let toastActivityStyle: ToastStyle = {
            var style = ToastStyle()
            style.activityBackgroundColor = .clear
            style.maxHeightPercentage = 0.5
            style.activityIndicatorColor = Colors.activityColor.color
            ToastManager.shared.style = style
            return style
        }()
    
    var refreshControl: UIRefreshControl = {
            var refresh = UIRefreshControl()
            refresh.tintColor = Colors.activityColor.color
            return refresh
        }()
    
    @IBOutlet private weak var headerBGView: UIImageView!
    @IBOutlet private weak var headerLabelView: HeadLabel!
    @IBOutlet private weak var consultantsCV: UICollectionView!
    var scrollableView: UIScrollView {
        return self.consultantsCV
    }
     
    
    
    var presenter: ListScreenPresenterProtocol!
    lazy var consultantCVAdapter = ConsultantCVAdapter(for: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configConsultantCV()
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        presenter.viewLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configHeaderUI()
        configNavBar()
        
    }
        
    func configHeaderUI() {
        headerBGView.shapeSpecificCorners(with: 40,
                                          corners: .layerMaxXMaxYCorner)
    }
    
    func configNavBar() {
        self.hideNavigationBar()
        
        let searchButton = UIBarButtonItem.barButtonWithImage(img: Assets.icSearch.image)
        navigationItem.leftBarButtonItem = searchButton
        let backButton = UIBarButtonItem.barButtonWithImage(img: Assets.icBackArrow.image)
        navigationItem.rightBarButtonItem = backButton
    }
    
    func configConsultantCV() {
        let cellNib = UINib(nibName: "ConsultantCell",
                            bundle: Bundle.main)

        consultantsCV.register(cellNib,
                               forCellWithReuseIdentifier: "ConsultantCell")
        
        consultantsCV.refreshControl = refreshControl

        consultantsCV.backgroundColor = .clear
        
        consultantCVAdapter.configDataSource()
        consultantsCV.dataSource = consultantCVAdapter.consultantCVDataSource
        
        consultantsCV.delegate = consultantCVAdapter
    }
    
    @objc func refresh() {
        presenter.refreshConsultantData()
    }
    
}
