//
//  DexUserVCViewModel.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class DexUserVCViewModel {
 
    var users = [DexUserViewModel]()
    var hasNext = false
    var nextDexId : String?
    
    func fetchUsers(dexID:String, completion:@escaping ()->()){
        let dexuserService = DexUsersService()
        dexuserService.getDexUsers(dexID: dexID, completion: { [weak self](users,nextDexId) in
            DispatchQueue.main.async {
                self?.nextDexId = nextDexId
                let arrUserVM = users.map({ return DexUserViewModel.init(user: $0)})
                self?.users.append(contentsOf: arrUserVM)
                completion()
            }
        }) { (error) in
            //Handle Error Here
        }
    }
}

struct DexUserViewModel {

    var firstName: String?
    var lastName: String?
    var imageUrl: String?
    var clapsCount: Int?

    init(user:User) {
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.imageUrl = user.imageUrl
        self.clapsCount = user.totalProjectClaps
    }
}


