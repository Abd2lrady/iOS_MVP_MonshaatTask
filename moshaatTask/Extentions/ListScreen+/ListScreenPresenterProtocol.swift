//
//  ListScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenPresenterProtocol: AnyObject {
    func viewLoaded()
    func loadMoreConsultants()
    func refreshConsultantData()
}
