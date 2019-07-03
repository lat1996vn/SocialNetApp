//
//  Post.swift
//  SocialNetApp
//
//  Created by TuanLA on 7/1/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import Foundation
import UIKit

struct Post {
    //var postID: Int!
    //var posterID: Int = 1
    var poster: User
    var like: Int
    var postContent: String
    var createTime: Date
    var postImage: UIImage?
    var comment: Int
    init(poster: User, postContent: String, postImage: UIImage?) {
        self.poster = poster
        self.postContent = postContent
        if let img = postImage {
            self.postImage = img
        }
        self.createTime = Date()
        self.like = 0
        self.comment = 0
    }
    
//    mutating func setPostImage(image: UIImage) {
//        self.postImage = image
//    }
    
    
}

//func getCurrentDate() -> String {
//    let currentDate = Date()
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd/MM"
//    let dateString = dateFormatter.string(from: currentDate)
//    return dateString
//}
