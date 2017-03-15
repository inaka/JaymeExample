//
//  SettingsViewController.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tokenTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tokenTextView.text = Cache.sharedCache.userToken
        self.tokenTextView.becomeFirstResponder()
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        self.saveAndDismiss()
    }
    
    fileprivate func saveAndDismiss() {
        Cache.sharedCache.userToken = self.tokenTextView.text
        self.tokenTextView.resignFirstResponder()
        self.dismiss()
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.saveAndDismiss()
        return true
    }
    
}
