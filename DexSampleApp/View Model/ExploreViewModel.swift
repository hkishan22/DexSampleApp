//
//  ExploreViewModel.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


protocol SectionNavigationHandler{
    func handleAction(sectionType:SectionType,entity:Entities,title:String)
}


class ExploreViewModel: NSObject {

    var sectionLayouts = [ExploreSection]()
    
    //var sectionLayouts = [SectionViewModel]()

    
    func fetchSections(completion:@escaping ()->()){
        let service = ExploreServices()
        service.getAllSections(completion: { layouts in
            self.sectionLayouts = layouts
            DispatchQueue.main.async {
                completion()
            }
        }) { (error) in
            //Handle Error Here
        }
    }
}


struct SectionViewModel {

}



