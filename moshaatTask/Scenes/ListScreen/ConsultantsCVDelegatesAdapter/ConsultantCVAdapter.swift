//
//  ConsultantCVAdapter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

class ConsultantCVAdapter: NSObject {
    
    var consultants = [Consultant]()
    var consultantCV: UICollectionView
    lazy var consultantCVDataSource = createConsultantDataSource()

    init(for consultantCV: UICollectionView) {
        self.consultantCV = consultantCV
    }
   
    func getConsultant(at indexPath: IndexPath) -> Consultant {
        return consultants[indexPath.row]
    }
    
}
