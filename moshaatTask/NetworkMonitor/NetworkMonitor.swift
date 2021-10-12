//
//  NetworkMonitor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Network

class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    private init() { }
    
    var isConnected: Bool {
        do {
            let reachability = try Reachability()
            let status = reachability.connection
            switch status {
            case.unavailable:
                return false
            case .cellular, .wifi:
                return true
            }
        } catch {
            print("error with reachability")
            return false
        }
    }

    
    
    
    
    
    
    
//    private let monitor: NWPathMonitor
//
//    var conectionStatus: Bool = false
//
//
//    var isConnected: Bool {
//
//        startMonitoring()
//
//        monitor.pathUpdateHandler = {[weak self] path in
//            if path.status == .satisfied {
//                self?.conectionStatus = true
//            } else {
//                self?.conectionStatus = false
//            }
//        }
//        return conectionStatus
//    }
//
//    func startMonitoring() {
//        monitor.start(queue: .global())
//    }
//
//    func stopMonitoring() {
//        monitor.cancel()
//    }
 
}
