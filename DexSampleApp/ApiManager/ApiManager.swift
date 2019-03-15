//
//  ApiManager.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

typealias APIResponseClosure = (Data?,Error?) -> Void


class APIManager: NSObject {

    
    enum REQUEST_TYPE : String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    static func request(urlString : String,header:[String:String]? = nil, method : REQUEST_TYPE, httpBody : Data?,_ isChache: Bool = false,completion:@escaping APIResponseClosure ){

        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = httpBody

        if header != nil {
            request.allHTTPHeaderFields = header!
        }else{
            request.allHTTPHeaderFields = APIManager.getHTTPHeader()
        }

        // Later On URL Session can be replaced by Alamofire or other HTTP Librarary
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let response = resp {
                print(response)
            }

            if let error =  err {
                completion(nil,error)
            }else if let data = data {
                completion(data,nil)
            }
            }.resume()
    }
    
    

    //All Common Headers for all API(s) are added Here
    static func getHTTPHeader()-> Dictionary<String, String>{
        let headers = ["Content-Type":"application/json"]
        return headers
    }
}
