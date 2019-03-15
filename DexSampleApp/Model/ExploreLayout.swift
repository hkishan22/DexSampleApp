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

struct ExploreSection {
    var type: SectionType = .Unknown
    var sectionRefreshStatus : SectionRefreshStatus = .notLoading
    var entities = [Entities]()
    
    init(withJson:[JSON]) {
        
    }
}

protocol Entities:Codable {
}

protocol  RequirementEntiries:Entities {
    var _id:                String {get set}
    var name:               String {get set}
    var slug:               String {get set}
    var _dex:               DexEntites {get set}
    var creator:            UserEntities {get set}
}

protocol BannerEntities:Entities {
    var imageUrl:           String {get set}
    var actionUrl:          String {get set}
}

protocol DexEntites:Entities {
    var _id:                String {get set}
    var name:               String {get set}
    var userTerm:           String {get set}
    var imageRatio:         Double {get set}
    var imageUrl:           String {get set}
    var userTermSlug:       String {get set}
}

protocol UserEntities:Entities {
    var _id:                String {get set}
    var firstName:          String {get set}
    var lastName:           String {get set}
    var handle:             String {get set}
    var imageUrl:           String {get set}
    var totalProjectClaps:  String {get set}
}


