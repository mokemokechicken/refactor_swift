//
//  LatestViewController.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit
import ImageLoader

class LatestItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataSource: QiitaItemListViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = QiitaItemListViewDataSource(data: [], tableView: tableView)
        tableView.dataSource = dataSource
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let api = QiitaApiImpl(baseUrl: "https://qiita.com")
        api.getLatestItems().success { [unowned self] itemList in
            self.dataSource.replaceData(itemList)
        }
    }
    
}
