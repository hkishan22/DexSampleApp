//
//  ExploreViewModel.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit



class ExploreViewModel: NSObject {

    var layoutViewModels = [LayoutViewModel]()

    func fetchSections(completion:@escaping ()->()){
        let service = ExploreServices()
        service.getAllSections(completion: { layouts in
            self.layoutViewModels = layouts.map({return LayoutViewModel.init(section: $0)})
            DispatchQueue.main.async {
                completion()
            }
        }) { (error) in
            //Handle Error Here
        }
    }
}

class LayoutViewModel {
    var type: SectionType = .Unknown
    var sectionRefreshStatus : SectionRefreshStatus = .notLoading
    var sectionViewModels = [SectionViewModel]()
    var title = ""
    
    init(section:ExploreSection) {
        self.title = section.title
        self.type = section.type
        self.sectionRefreshStatus = section.sectionRefreshStatus
        for entity  in section.entities {
            switch section.type {
            case .Requirement:
                if let reqEntity = entity as? RequirementEntities {
                    self.sectionViewModels.append(RequirementSectionViewModel.init(requirement: reqEntity))
                }
            case .Banner:
                if let bannerEntity = entity as? BannerEntities {
                    self.sectionViewModels.append(BannerSectionViewModel.init(banner: bannerEntity))
                }
            case .User:
                if let userEntity = entity as? UserEntities {
                    self.sectionViewModels.append(UserSectionViewModel.init(user: userEntity))
                }
            case .Dex:
                if let dexEntity = entity as? DexEntites {
                    self.sectionViewModels.append(DexSectionViewModel.init(dex: dexEntity))
                }
            case .Unknown:
                self.sectionViewModels = section.entities.map({return SectionViewModel.init(entity: $0)})
            }
        }
    }
}

class SectionViewModel {
    init(entity: Entities) {
    }
}

class RequirementSectionViewModel: SectionViewModel {
    var requirementText: String?
    var locationText: String?
    var imageUrl: String?
    
    init(requirement:RequirementEntities) {
        super.init(entity: requirement)
        
        self.requirementText = (requirement._dex?.userTerm != nil) ? "\(requirement._dex!.userTerm!) Required" : nil
        
        self.locationText = (requirement.creator?.firstName != nil) ? "Anywhere in the world - by \(requirement.creator!.firstName! + requirement.creator!.lastName!)" : nil
        
        self.imageUrl = requirement._dex?.imageUrl
    }
}

class DexSectionViewModel: SectionViewModel {
    var title: String?
    var id: String?
    var imageUrl: String?

    init(dex:DexEntites) {
        super.init(entity: dex)
        self.title = dex.userTerm
        self.imageUrl = dex.imageUrl
        self.id = dex._id
    }
}

class BannerSectionViewModel:SectionViewModel {
    var imageUrl:           String?
    var actionUrl:          String?
    
    init(banner:BannerEntities) {
        super.init(entity: banner)
        self.imageUrl = banner.imageUrl
        self.actionUrl = banner.actionUrl
    }
}

class UserSectionViewModel:SectionViewModel {
    var firstName:           String?
    var lastName:           String?
    var clapsCountText:           String?
    var imageUrl:           String?
    
    init(user:UserEntities) {
        super.init(entity: user)
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.imageUrl = user.imageUrl
        self.clapsCountText = (user.totalProjectClaps != nil) ? "👏 " +  "\(user.totalProjectClaps!)" : nil
    }
}

