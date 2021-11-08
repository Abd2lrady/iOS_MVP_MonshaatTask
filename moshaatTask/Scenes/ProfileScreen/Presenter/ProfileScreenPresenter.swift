//
//  ProfileScreenPresenter.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit
import CoreLocation

class ProfileScreenPresenter {
    weak var view: ProfileScreenViewProtocol?
    let consultant: Consultant
    var currentPage = 1
    var totalPages = 1
    var sessions = [Session]() {
        didSet {
            formattedSessions.removeAll()
            sessions.forEach { session in
                guard let formattedSession = formateSessionDate(session: session) else { return }
                formattedSessions.append(formattedSession)
            }
        }
    }
    var formattedSessions = [FormattedSession]()
    var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "ar")
        formater.dateFormat = "EEEE ،d MMM"
        return formater
    }()
    
    var timeFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "h:mm a"
        return formater
    }()
    
    let geoCoder = CLGeocoder()
        
    var info: Info?
    let profileScreenInteractor = ProfileScreenInteractor()

    init(view: ProfileScreenViewProtocol, consultant: Consultant) {
        self.view = view
        self.consultant = consultant
    }
    
    func getSessions(id: String, page: Int) {
        profileScreenInteractor.getSessions(id: id, page: page) { [weak self] response, error in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }
            self?.view?.hideNoInternet()
            guard let response = response else {
                self?.view?.showError(message: error?.localizedDescription ?? "error")
                return }
            self?.sessions = response.data ?? [Session]()
            self?.totalPages = response.pagination?.totalPages ?? 1
            self?.view?.hideActivityIndicator()
            self?.view?.sessionsDataLoaded()
        }
    }
    
    func getInfo(id: String) {
        profileScreenInteractor.getInfo(id: id) {[weak self] response, error in
            guard NetworkMonitor.shared.isConnected else {
                self?.view?.showNoInternet()
                return }
            self?.view?.hideNoInternet()
            guard let response = response else {
                self?.view?.showError(message: error?.localizedDescription ?? "error")
                return }
            self?.info = response.data
            self?.view?.hideActivityIndicator()
            self?.view?.infoDataLoaded()
        }
    }
    func configHeaderView() {
        view?.headerView?.setName(with: consultant.ssoUser?.fullName ?? "no name")
        view?.headerView?.setRate(with: consultant.rating ?? 0)
        view?.headerView?.setInterests(with: consultant.interests ?? [""])
        view?.headerView?.setSpeciality(with: consultant.subject?.title ?? "")
        view?.headerView?.setProfileImg(with: consultant.file?.path ?? "")
    }
    
    private func formateDate(timeStamp: Int?) -> String? {
        guard let timeStamp = timeStamp else { return nil }
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        return dateFormater.string(from: date)
    }
    
    private func formateTime(timeStamp: Int?) -> String? {
        guard let timeStamp = timeStamp else { return nil }
        let time = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        return timeFormater.string(from: time)
    }
    
//    private func formateAddress(lat: Double, long: Double) -> String? {
//        let location = CLLocation(latitude: lat, longitude: long)
//        var address: String?
//        geoCoder.reverseGeocodeLocation(location) { placeMarks, _ in
//            guard let placeMark = placeMarks?.first else {
//                address = "Address not valid"
//                return
//            }
//            address = "\(placeMark.country), \(placeMark.locality)"
//        }
//        return address
//    }
    
    private func formateSessionDate(session: Session) -> FormattedSession? {
        let foramttedDate = formateDate(timeStamp: session.day)
        var schdules = [FormattedSchedule]()
        guard let schedules = session.schedules else { return nil }
        for schedule in schedules {
            let time = formateTime(timeStamp: schedule.startTime)
            let address = schedule.office?.center?.address
            schdules.append(FormattedSchedule(startHour: time ?? "", address: address ))
        }
        return FormattedSession(day: foramttedDate, schedules: schdules)
    }
}
