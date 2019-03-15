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
    
    init(withJson:[JSON]) {
        
    }
}

class Entities {

}


class  RequirementEntiries:Entities {
    var _id:                String?
    var name:               String?
    var slug:               String?
    var _dex:               DexEntites?
    var creator:            UserEntities?
}

class BannerEntities:Entities {
    var imageUrl:           String?
    var actionUrl:          String?
}

class DexEntites:Entities {
    var _id:                String?
    var name:               String?
    var userTerm:           String?
    var imageRatio:         Double?
    var imageUrl:           String?
    var userTermSlug:       String?
}

class UserEntities:Entities {
    var _id:                String?
    var firstName:          String?
    var lastName:           String?
    var handle:             String?
    var imageUrl:           String?
    var totalProjectClaps:  String?
}

