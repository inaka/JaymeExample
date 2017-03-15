//
//  UIViewController+Dismiss.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2016 HappyTail AB. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @IBAction func dismiss(_ sender: AnyObject? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
