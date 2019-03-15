//
//  NavigationHelper.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class NavigationHelper {

    static func redirectToWebPageWIthURL(urlString:String, presentFrom:UIViewController,title:String? = nil){
        let webviewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        webviewVC.str_urlToLoad = urlString
        webviewVC.str_viewControllerTitle = title
        presentFrom.navigationController?.navigationBar.topItem?.title = ""
        presentFrom.navigationController?.pushViewController(webviewVC, animated: true)
    }
}
