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
                                                  cellProvider: {(collectionView, indexPath, consultants)
                                                    -> UICollectionViewCell in
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConsultantCell.reuseID,
                                                            for: indexPath) as? ConsultantCell
                                                        
        else { fatalError("can`t dequeue the cell with id \(ConsultantCell.reuseID)") }
                                                        
       return cell})
    }
    
    func updateConsultantCV() {
        var currentSnapShot = consultantCVDataSource.snapshot()
        
        currentSnapShot.appendSections([.one])
        currentSnapShot.appendItems(consultants, toSection: .one)
        consultantCVDataSource.apply(currentSnapShot)
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
