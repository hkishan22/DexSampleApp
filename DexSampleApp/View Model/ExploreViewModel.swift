//
//  ExploreViewModel.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


protocol SectionNavigationHandler{
    func handleUrlAction(urlString:String,title:String)
}


class ExploreViewModel: NSObject {

    var sectionLayouts = [ExploreSection]()
    
    func fetchSections(completion:@escaping ()->()){
        let service = ExploreServices()
        service.getAllSections(completion: { layouts in
            self.sectionLayouts = layouts
            DispatchQueue.main.async {
                completion()
            }
        }) { (error) in
        }
    }
}



