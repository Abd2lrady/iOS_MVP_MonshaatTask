//
//  ViewController.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady
import Kingfisher
import Toast

import UIKit

class ListScreenVC: UIViewController {
    
    @IBOutlet private weak var headerBGView: UIImageView!
    @IBOutlet private weak var headerLabelView: HeadLabel!
    @IBOutlet private weak var consultantsCV: UICollectionView!
    
    let presenter: ListScreenPresenterProtocol? = nil
    lazy var consultantCVAdapter = ConsultantCVAdapter(for: consultantsCV)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configConsultantCV()        
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

        consultantsCV.backgroundColor = .clear
        
        consultantsCV.dataSource = consultantCVAdapter.consultantCVDataSource
        consultantCVAdapter.updateConsultantCV()
    }
    
}
