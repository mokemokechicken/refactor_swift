//
//  ItemDetailViewController.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var itemUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: itemUrl) {
            webView.loadRequest(NSURLRequest(URL: url))
        }
    }
}
