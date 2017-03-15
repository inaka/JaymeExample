//
//  UIAlertController+Debug.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func alert(title: String? = nil, message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
}

extension Error {
    
    func alert(title: String? = nil, message: String? = nil) -> UIAlertController {
        let debugMessage: String
        if let description = message {
            debugMessage = "\(description)\n\nDebug Info:\n\(self)"
        } else {
            debugMessage = "\(self)"
        }
        return UIAlertController.alert(title: title, message: debugMessage)
    }
    
}
