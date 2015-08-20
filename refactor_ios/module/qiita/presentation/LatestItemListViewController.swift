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
        
        dataSource = QiitaItemListViewDataSource(data: [])
        tableView.dataSource = dataSource
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

class QiitaItemListViewDataSource: NSObject, UITableViewDataSource {

    let data: [QiitaItemCellEntity]

    init(data: [QiitaItemCellEntity]) {
        self.data = data
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: QiitaItemCell = tableView.dequeueReusableCellWithIdentifier("QiitaItem", forIndexPath: indexPath) as! QiitaItemCell
        let item = data[indexPath.item]
        cell.titleView.text = item.title
        
        // この実装も高速スクロールしたときの課題が残っている
        cell.imageView?.load(item.iconUrl, placeholder: nil) { _ in
            cell.setNeedsLayout()
        }
        return cell
    }
    
}




