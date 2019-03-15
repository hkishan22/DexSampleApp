//
//  ExploreLayout.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

enum SectionType : String{ // "sectionType"
    
    case    Requirement             =   "requirement"
    case    Banner                  =   "banner"
    case    User                    =   "user"
    case    Dex                     =   "dex"
    case    Unknown                 =   ""
    static let allValues = [Requirement, Banner, User, Dex,Unknown]
}

enum SectionRefreshStatus {
    case notLoading
    case loading
    case loadedSuccessfully
    case loadingFailed
}

class ExploreSection {
    var type: SectionType = .Unknown
    var sectionRefreshStatus : SectionRefreshStatus = .notLoading
    var entities = [Entities]()
    var title = ""
    
    init(with Json:JSON) {
        
        if let title  = Json["title"].string {
            self.title = title
        }
        
        if let sectionType  = Json["sectionType"].string {
            self.type = SectionType.init(rawValue: sectionType) ?? .Unknown
        }
        
        if let entities  = Json["entities"].array {
            for entity in entities {
                switch self.type {
                case .Banner:
                    let ent = BannerEntities.init(with: entity)
                    self.entities.append(ent)
                case .Dex:
                    let ent = DexEntites.init(with: entity)
                    self.entities.append(ent)

                case .Requirement:
                    let ent = RequirementEntities.init(with: entity)
                    self.entities.append(ent)

                case .User:
                    let ent = UserEntities.init(with: entity)
                    self.entities.append(ent)

                case .Unknown:
                    break
                }
            }
        }
    }
}


class Entities {
    init(with Json:JSON) {
    }
}


class  RequirementEntities:Entities {
    var _id:                String?
    var name:               String?
    var slug:               String?
    var _dex:               DexEntites?
    var creator:            UserEntities?
    
    override init(with Json:JSON) {
        super.init(with: Json)
        self._id = Json["_id"].string
        self.name = Json["name"].string
        self.slug = Json["slug"].string
        self._dex = DexEntites.init(with: Json["dex"])
        self.creator = UserEntities.init(with: Json["creator"])
    }
}

class BannerEntities:Entities {
    var imageUrl:           String?
    var actionUrl:          String?
  
    override init(with Json:JSON) {
        super.init(with: Json)
        self.imageUrl = Json["imageUrl"].string
        self.actionUrl = Json["actionUrl"].string
    }

}

class DexEntites:Entities {
    var _id:                String?
    var name:               String?
    var userTerm:           String?
    var imageRatio:         Double?
    var imageUrl:           String?
    var userTermSlug:       String?
    
    override init(with Json:JSON) {
        super.init(with: Json)
        self._id = Json["_id"].string
        self.name = Json["name"].string
        self.userTerm = Json["userTerm"].string
        self.imageUrl = Json["imageUrl"].string
        self.userTermSlug = Json["userTermSlug"].string
        self.imageRatio = Json["imageRatio"].double
    }
}

class UserEntities:Entities {
    var _id:                String?
    var firstName:          String?
    var lastName:           String?
    var handle:             String?
    var imageUrl:           String?
    var totalProjectClaps:  Int?
    
    override init(with Json:JSON) {
        super.init(with: Json)
        self._id = Json["_id"].string
        self.firstName = Json["firstName"].string
        self.lastName = Json["lastName"].string
        self.handle = Json["handle"].string
        self.totalProjectClaps = Json["totalProjectClaps"].int
        self.imageUrl = Json["imageUrl"].string
    }

}

