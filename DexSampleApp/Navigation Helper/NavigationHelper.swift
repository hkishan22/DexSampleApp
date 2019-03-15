//
//  NavigationHelper.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class NavigationHelper {

    static func redirectToWebPageWIthURL(webViewViewModel:WebViewViewModel, presentFrom:UIViewController){
        let webviewVC =  WebViewViewController.webViewViewController(viewModel: webViewViewModel)
        presentFrom.navigationController?.navigationBar.topItem?.title = ""
        presentFrom.navigationController?.pushViewController(webviewVC, animated: true)
    }
    
    static func redirectToDexUser(dexViewModel:DexUserVCViewModel, presentFrom:UIViewController){
        let dexUserVC =  DexUserViewController.dexUserViewController(viewModel: dexViewModel)
        presentFrom.navigationController?.navigationBar.topItem?.title = ""
        presentFrom.navigationController?.pushViewController(dexUserVC, animated: true)
    }
}
