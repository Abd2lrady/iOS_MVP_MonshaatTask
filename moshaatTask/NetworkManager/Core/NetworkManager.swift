//
//  NetworkManager.swift
//
import Foundation
import Moya

/// Closure to be executed when a request has completed.
typealias StatusCode = Int

class NetworkManager {
    
    static let shared: NetworkManager = {
        NetworkManager(config: .defaults)}()
    
    var networkConfig: NetworkDefaults!
    let provider: MoyaProvider<MultiTarget>
    let auth = AccessTokenPlugin { _ in
        return Strings.token
    }
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
    
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: loggerConfig),
                                                       auth])
    }
    
}
