//
//  UserProfileRepository.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation
import Jayme

class UserProfileRepository: Readable {
    
    typealias EntityType = UserProfile
    let backend: URLSessionBackend
    let name = "user"
    
    init(backend: URLSessionBackend = .gitHubBackend) {
        self.backend = backend
    }
    
}
