//
//  RepoCell.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var repo: Repo! {
        didSet {
            self.nameLabel.text = self.nameLabelText(for: repo)
            self.languageLabel.text = repo.language
        }
    }
    
    fileprivate func nameLabelText(for repo: Repo) -> String {
        if repo.isPrivate {
            return "🔒\(repo.fullName)"
        }
        return "👥\(repo.fullName)"
    }
    
}
