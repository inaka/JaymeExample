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
    
    func readAll() -> Future<[Repo], JaymeError> {
        let path = "\(self.name)?affiliation=owner"
        return self.backend.future(path: path, method: .GET, parameters: nil)
            .andThen { DataParser().dictionaries(from: $0.0) }
            .andThen { EntityParser().entities(from: $0) }
    }
    
    func create(name: String) -> Future<Repo, JaymeError> {
        let path = self.name
        let parameters = ["name": name]
        return self.backend.future(path: path, method: .POST, parameters: parameters)
            .andThen { DataParser().dictionary(from: $0.0) }
            .andThen { EntityParser().entity(from: $0) }
    }
    
}
