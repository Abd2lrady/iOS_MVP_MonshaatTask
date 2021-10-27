//
//  ListScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenPresenterProtocol: AnyObject {
    var consultants: [Consultant] { get set }
    func viewLoaded()
    func loadMoreConsultants()
    func refreshConsultantData()
}
