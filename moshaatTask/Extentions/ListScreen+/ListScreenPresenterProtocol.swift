//
//  ListScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import Foundation

protocol ListScreenPresenterProtocol: AnyObject {
    func viewLoaded()
    func getConsultantsList()
    func loadMoreConsultants()
    func refreshConsultantData()
}
