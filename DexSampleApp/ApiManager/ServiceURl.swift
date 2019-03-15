//
//  ServiceURl.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

var kBaseUrl = "https://valakt.dextra.com"

struct ServiceURl {
    static let  exploreUri = "/explore"
    static func dexUserUri(dexID:String)->String{
        return  "/explore/user?dexId=\(dexID)"
    }
}

