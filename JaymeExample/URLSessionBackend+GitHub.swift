//
//  URLSessionBackend+GitHub.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation
import Jayme

extension URLSessionBackend {
    
    class var gitHubBackend: URLSessionBackend {
        let basePath = "http://api.github.com"
        var headers = [HTTPHeader(field: "Accept", value: "application/vnd.github.v3+json"),
                       HTTPHeader(field: "Content-Type", value: "application/json")]
        if let token = Cache.sharedCache.userToken {
            headers += [HTTPHeader(field: "Authorization", value: "token \(token)")]
        }
        let configuration = URLSessionBackendConfiguration(basePath: basePath, httpHeaders: headers)
        return URLSessionBackend(configuration: configuration)
    }
    
}
