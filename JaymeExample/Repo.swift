//
//  Repo.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation
import Jayme

struct Repo: Identifiable {
    let id: Int
    let fullName: String
    let isPrivate: Bool
    let language: String?
}

extension Repo: DictionaryInitializable {
    
    init(dictionary: [AnyHashable: Any]) throws {
        guard
            let id = dictionary["id"] as? Int,
            let fullName = dictionary["full_name"] as? String,
            let isPrivate = dictionary["private"] as? Bool
            else { throw JaymeError.parsingError }
        self.id = id
        self.fullName = fullName
        self.isPrivate = isPrivate
        self.language = dictionary["language"] as? String
    }
    
}
