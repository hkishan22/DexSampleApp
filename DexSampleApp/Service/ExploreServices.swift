//
//  ExploreServices.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExploreServices {

    var sectionInstances = [ExploreSection]()
    
    
    func getAllSections(completion: @escaping ([ExploreSection]) -> (),
                        failure: @escaping (String) -> ()){
        
        let urlString = kBaseUrl + ServiceURl.exploreUri
        APIManager.request(urlString: urlString, method: .get, httpBody: nil) { (data, error) in
            
            if let data = data {
                do {
                    let JsonResponse = try JSON(data: data)
                    if let section_instances = JsonResponse["explore"].array {
                        for section in section_instances {
                            let layout  =  ExploreSection.init(with: section)
                            self.sectionInstances.append(layout)
                        }
                        completion(self.sectionInstances)
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
