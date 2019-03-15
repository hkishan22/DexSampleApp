//
//  WebViewViewController.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import WebKit


class WebViewViewController: UIViewController,UIWebViewDelegate,WKNavigationDelegate {

    var webView = WKWebView()
    var str_urlToLoad:String!
    var activityIndicator = UIActivityIndicatorView(style: .gray)
    var str_viewControllerTitle : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        
        if let url = URL(string: self.str_urlToLoad){
            let request = URLRequest(url: url)
            self.webView.load(request)
            self.view = webView
        }
        self.showActivityIndicator()
        self.title = self.str_viewControllerTitle
    }
    
    
    func showActivityIndicator(){
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.startAnimating()
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func hideActivityIndicator(){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideActivityIndicator()
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideActivityIndicator()
    }

    
}
