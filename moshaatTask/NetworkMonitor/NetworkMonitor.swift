//
//  NetworkMonitor.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor: NWPathMonitor

    private init() {
        monitor = NWPathMonitor()
    }
    

    var isConnected: Bool {
        
        var status: Bool = false
        
        startMonitoring()
        
        monitor.pathUpdateHandler = { path in
            status = path.status == .satisfied
        }
        
        stopMonitoring()
        
        return status
    }
    
    func startMonitoring() {
        monitor.start(queue: DispatchQueue.global())
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
 
}
