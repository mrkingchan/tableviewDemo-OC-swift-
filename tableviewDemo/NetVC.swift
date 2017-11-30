//
//  NetVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/26.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

class NetVC: UIViewController,UIWebViewDelegate {
    // MARK: lifeCircle
    var webView:UIWebView?;
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        webView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
        webView?.delegate = self as UIWebViewDelegate;
        let urlValue = URL.init(string: "http://www.baidu.com");
        let urlRequest = URLRequest.init(url: urlValue!);
        webView?.dataDetectorTypes = UIDataDetectorTypes.link;
        self.view.addSubview(webView!);
        webView?.loadRequest(urlRequest);
    }

    // MARK: UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    }
    
    // MARK: memory Management
    deinit {
        
    }
}
