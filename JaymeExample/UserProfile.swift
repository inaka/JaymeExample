//
//  UserProfile.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import Foundation
import Jayme

struct UserProfile: Identifiable {
    let id: Int
    let nickname: String
    let fullName: String
    let avatarURL: URL // TODO: Check if this URL can be nil
    let bio: String
    let followersCount: Int
    let followingCount: Int
}

extension UserProfile: DictionaryInitializable {
    
    init(dictionary: [AnyHashable: Any]) throws {
        guard
            let id = dictionary["id"] as? Int,
            let nickname = dictionary["login"] as? String,
            let fullName = dictionary["name"] as? String,
            let avatarURLString = dictionary["avatar_url"] as? String,
            let avatarURL = URL(string: avatarURLString),
            let bio = dictionary["bio"] as? String,
            let followersCount = dictionary["followers"] as? Int,
            let followingCount = dictionary["following"] as? Int
            else { throw JaymeError.parsingError }
        self.id = id
        self.nickname = nickname
        self.fullName = fullName
        self.avatarURL = avatarURL
        self.bio = bio
        self.followersCount = followersCount
        self.followingCount = followingCount
    }
    
}
