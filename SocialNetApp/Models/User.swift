//
//  User.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//
import UIKit
import Foundation

struct User {
    var userID: Int = 1
    var username: String!
    var password: String!
    var email: String!
    var Address: String?
    var birthday: String?
    var image: UIImage?
    var userPosts: [Post]?
    
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
    
}
