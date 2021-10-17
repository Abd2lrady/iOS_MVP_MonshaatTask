//
//  ConsultantCVAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ConsultantCVAdapter: NSObject {
    
    var consultants = [Consultant]()
    
    weak var view: ViewDelegate?
    var showFooter = false
    lazy var consultantCV: UICollectionView = {
        guard let collectionView = view?.scrollableView as? UICollectionView
        else { fatalError("no scrollableView") }
        return collectionView
    }()
    
    lazy var consultantCVDataSource = createConsultantDataSource()

    init(for view: ViewDelegate) {
        self.view = view
    }
   
    func getConsultant(at indexPath: IndexPath) -> Consultant {
        return consultants[indexPath.row]
    }
    
    func noMoreConsultantsFooter() {
        let snap = consultantCVDataSource.snapshot()
        showFooter = true
        consultantCVDataSource.apply(snap)
    }
}
