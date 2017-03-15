//
//  Cache.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation

class Cache {
    
    static let sharedCache = Cache()
    
    fileprivate let defaults = UserDefaults.standard
    
    var userToken: String? {
        get {
            return self.defaults.string(forKey: "user_token")
        }
        set {
            self.defaults.set(newValue, forKey: "user_token")
            self.defaults.synchronize()
        }
    }
    
}
