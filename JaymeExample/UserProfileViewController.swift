//
//  UserProfileViewController.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit
import Jayme
import SVProgressHUD

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var followersFollowingLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var viewReposButton: UIButton!

    enum State {
        case initial
        case reset
        case loading
        case loaded(UserProfile)
        case failed(JaymeError)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.state = .reset
        self.loadUserProfile()
    }

    fileprivate func loadUserProfile() {
        self.state = .loading
        UserProfileRepository().read().start { result in
            switch result {
            case .success(let profile):
                self.state = .loaded(profile)
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
    
    var state: State = .initial {
        didSet {
            switch state {
            case .initial:
                break
                
            case .reset:
                self.title = ""
                self.avatarImageView.image = nil
                self.nicknameLabel.text = nil
                self.followersFollowingLabel.text = nil
                self.bioTextView.text = nil
                self.viewReposButton.isHidden = true
                
            case .loading:
                self.title = "Loading..."
                SVProgressHUD.show()
                
            case .loaded(let profile):
                self.title = profile.fullName
                SVProgressHUD.dismiss()
                self.avatarImageView.setImage(from: profile.avatarURL)
                self.nicknameLabel.text = profile.nickname
                self.followersFollowingLabel.text = "\(profile.followersCount) FOLLOWERS | \(profile.followingCount) FOLLOWING"
                self.bioTextView.text = profile.bio
                self.viewReposButton.isHidden = false
                
            case .failed(let error):
                self.title = "<- Go to Settings"
                SVProgressHUD.dismiss()
                self.showAlert(for: error, message: "Could not load your profile.\n\nGo to Settings and configure your Github's Personal access token.")
            }
        }
    }

}
