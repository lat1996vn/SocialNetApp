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
//    var userID: String = UUID().uuidString
    var username: String
    var password: String
    var email: String
    var address: String?
    var birthday: String?
    var image: UIImage?
    //var userPosts: [Post]?
    
    init(username: String, password: String, email: String, image: UIImage?) {
        self.username = username
        self.password = password
        self.email = email
        if let img = image {
            self.image = img
        }
    }
    
}
