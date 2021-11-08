//
//  AppCoordinator+CoordinatorProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension AppCoordinator: CoordinatorProtocol {
    
    func start() {
        
        let navigator = UINavigationController()
        let router = Router(navigator: navigator)
//        let listScreenCoordinator = ListScreenCoordinator(router: router, parentCoordinator: self)
//        self.childCoordinators.append(listScreenCoordinator)
//        listScreenCoordinator.start()

//        let profileScreenCoordinator = ProfileScreenCoordinator(router: router,
//                                                                id: "93f4d920-0720-4a84-8f84-fed97dfa49f2")
//        self.childCoordinators.append(profileScreenCoordinator)
//        profileScreenCoordinator.start()
        let schedules = [FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa"),
                         FormattedSchedule(startHour: "asd", address: "asddsa")]
        
        let session = FormattedSession(day: "asdads",
                                       schedules: schedules)
        let bookingCoordinator = BookingSheetCoordinator(router: router,
                                                         parentCoordinator: self,
                                                         session: session,
                                                         selectedAppointment: 0)
        bookingCoordinator.start()
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
    
}
