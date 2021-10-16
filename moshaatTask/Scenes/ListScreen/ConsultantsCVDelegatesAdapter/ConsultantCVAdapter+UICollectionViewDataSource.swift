//
//  ConsultantCVAdapter+UICollectionViewDataSource.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension ConsultantCVAdapter {
    
    func createConsultantDataSource() -> UICollectionViewDiffableDataSource< ConsultantsCVSections,
                                                                              Consultant > {
        return UICollectionViewDiffableDataSource(collectionView: consultantCV,
                                                  cellProvider: {(collectionView, indexPath, consultant)
                                                    -> UICollectionViewCell in
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConsultantCell.reuseID,
                                                            for: indexPath) as? ConsultantCell
                                                        
        else { fatalError("can`t dequeue the cell with id \(ConsultantCell.reuseID)") }
        
        self.configConsultantCell(cell: cell, consultant: consultant)
       
        return cell})
        
    }
    
    func configDataSource() {
        var snapShot = NSDiffableDataSourceSnapshot<ConsultantsCVSections, Consultant>()
        snapShot.appendSections([.main])
        consultantCVDataSource.apply(snapShot)
    }
    
    func refreshConsultantsCV() {
        var currentSnapShot = consultantCVDataSource.snapshot()
//        currentSnapShot.deleteItems(consultants)
        currentSnapShot.reloadItems(consultants)
        consultantCVDataSource.apply(currentSnapShot, animatingDifferences: true)
    }
    
    func addMoreToConsultantCV() {
        var currentSnapShot = consultantCVDataSource.snapshot()
        currentSnapShot.appendItems(consultants, toSection: .main)
        consultantCVDataSource.apply(currentSnapShot, animatingDifferences: true)
    }
    
    func configConsultantCell(cell: ConsultantCellProtocol, consultant: Consultant) {
        
        cell.setProfileImg(path: consultant.file?.path ?? "")
        
        cell.setNameLabel(with: consultant.ssoUser?.fullName ?? "No name")
        
        cell.setRate(with: consultant.rating ?? 0)
        
        cell.setSpecializationLabel(with: consultant.interests ?? [" "])
        
        if consultant.isOnline == true {
            cell.setAvailiability(with: Strings.Consultant.isOnline,
                                  color: Colors.availabilityOnlineLabel.color)
            
            cell.setAvailbilityView(with: Colors.availabilityOnline.color)
        } else if consultant.isAvailable == true {
            cell.setAvailiability(with: Strings.Consultant.isAvailable,
                                  color: Colors.availabilityOfflineLabel.color)
            
            cell.setAvailbilityView(with: Colors.availabilityOffline.color)
        } else {
            cell.setAvailiability(with: Strings.Consultant.notAvailable,
                                  color: Colors.availabilityOfflineLabel.color)
            
            cell.setAvailbilityView(with: Colors.availabilityOffline.color)
        }
        
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//   
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cellNib = UINib(nibName: "ConsultantCell",
//                            bundle: Bundle.main)
//        collectionView.register(cellNib,
//                                forCellWithReuseIdentifier: "ConsultantCell")
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultantCell",
//                                                            for: indexPath) as? ConsultantCell
//                        else { fatalError("sad cell") }
//        cell.setNameLabel(with: Strings.ListScreen.title)
//        cell.setRate(with: 5)
//        cell.setSpecializationLabel(with: "sad")
//        cell.setAvailiability(with: "ls")
//        return cell
//    }
    
}
