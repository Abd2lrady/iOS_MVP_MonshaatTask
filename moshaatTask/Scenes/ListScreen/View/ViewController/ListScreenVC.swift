//
//  ViewController.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady
import Kingfisher
import MBProgressHUD
import Toast

import UIKit

class ListScreenVC: UIViewController,
                    UICollectionViewDataSource,
                    UICollectionViewDelegate,
                    UICollectionViewDelegateFlowLayout {
    
    @IBOutlet private weak var headerBGView: UIImageView!
    @IBOutlet private weak var headerLabelView: HeadLabel!
    @IBOutlet private weak var consultantsCV: UICollectionView!

    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
   
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNib = UINib(nibName: "ConsultantCell",
                            bundle: Bundle.main)
        collectionView.register(cellNib,
                                forCellWithReuseIdentifier: "ConsultantCell")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultantCell",
                                                            for: indexPath) as? ConsultantCell
                        else {fatalError("sad cell")}
        cell.setNameLabel(with: Strings.ListScreen.title)
        cell.setRate(with: 5)
        cell.setSpecializationLabel(with: "sad")
        cell.setAvailiability(with: "ls")
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configConsultantCV()
        consultantsCV.dataSource = self
        consultantsCV.delegate = self
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
        consultantsCV.backgroundColor = .clear
    }
    
}
