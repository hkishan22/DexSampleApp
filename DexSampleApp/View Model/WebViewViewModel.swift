//
//  WebViewViewModel.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class WebViewViewModel {

    private var str_urlToLoad : String?
    private var title : String?
    
    init(str_urlToLoad:String?, title:String?) {
        self.str_urlToLoad = str_urlToLoad
        self.title = title
    }
    
    func getTitle()->String?{
        return self.title
    }
    
    func getUrl()->String?{
        return self.str_urlToLoad
    }
}
