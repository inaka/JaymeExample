//
//  ReposRepository.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation
import Jayme

class ReposRepository: Readable {
    
    typealias EntityType = Repo
    let backend: URLSessionBackend
    let name = "user/repos"
    
    init(backend: URLSessionBackend = .gitHubBackend) {
        self.backend = backend
    }
    
}
