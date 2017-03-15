//
//  UIViewController+Alerts.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(for error: Error, message: String) {
        let alert = error.alert(title: "Error", message: message)
        self.present(alert, animated: true, completion: nil)
    }
    
}
