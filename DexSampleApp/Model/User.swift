//
//  User.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    var _id: String?
    var handle: String?
    var firstName: String?
    var lastName: String?
    var imageUrl: String?
    var updatedOn: String?
    var dexAppeal: String?
    var skillLevel: String?
    var availability: String?
    var followerCount: String?
    var totalProjectClaps: Int?
    // Parse Projects and geoLocaition here as per requierment
}

extension User {
    
     init(with Json:JSON) {
        self._id = Json["_id"].string
        self.handle = Json["handle"].string
        self.firstName = Json["firstName"].string
        self.lastName = Json["lastName"].string
        self.imageUrl = Json["imageUrl"].string
        self.updatedOn = Json["updatedOn"].string
        self.dexAppeal = Json["dexAppeal"].string
        self.skillLevel = Json["skillLevel"].string
        self.availability = Json["availability"].string
        self.followerCount = Json["followerCount"].string
        self.totalProjectClaps = Json["totalProjectClaps"].int
    }
}
