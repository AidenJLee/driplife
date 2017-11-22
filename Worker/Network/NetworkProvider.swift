//
//  NetworkProvider.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 22..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain

public enum HTTPStatusCode: Int {
    case continueS = 100    // 100 Informational
    case switchingProtocols // 101
    case processing
    case OK = 200           // 200 Success
    case created            // 201
    case accepted           // 202
    case nonAuthoritativeInformation
    
}

public enum ServiceHost: String {
    case Development =  "http://localhost/v001/driplife/"
    case Product =      "http://api.entist.com/v001/driplife"
    
    var baseURL: NSURL {
        guard let url = NSURL(string: self.rawValue) else {
            fatalError()
        }
        return url
    }
    
    func urlString(path: String) -> String {
        guard let urlString = self.baseURL.absoluteString else {
            fatalError()
        }
        return urlString + "\(path)"
    }
}

final class NetworkProvider {
    private let apiEndpoint: ServiceHost
    
    public init() {
        apiEndpoint = ServiceHost.Development
    }
    
    public func creatUsersNetwork() -> UsersNetwork {
        let network = Network<User>(apiEndpoint.rawValue)
        return UsersNetwork(network: network)
    }
}
