//
//  DexUsersService.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class DexUsersService: NSObject {

    func getDexUsers(dexID:String, completion: @escaping ([User],String?) -> (),
                        failure: @escaping (String) -> ()){

        let urlString = kBaseUrl + ServiceURl.dexUserUri(dexID: dexID)
        APIManager.request(urlString: urlString, method: .get, httpBody: nil) { (data, error) in
            
            if let data = data {
                do {
                    let JsonResponse = try JSON(data: data)
                    var userArray = [User]()
                    if let users = JsonResponse["users"].array {
                        for user in users {
                            userArray.append(User.init(with: user))
                        }
                        if var nextID = JsonResponse["next"].string, nextID != "False" {
                            nextID = nextID.replacingOccurrences(of: "?dexId=", with: "")
                            completion(userArray,nextID)
                        }else{
                            completion(userArray,nil)
                        }
                    }else{
                        failure("Empty response")
                    }
                } catch {
                    failure("Empty response")
                }
            }else if let err = error {
                failure(err.localizedDescription)
            }
        }
    }
}
