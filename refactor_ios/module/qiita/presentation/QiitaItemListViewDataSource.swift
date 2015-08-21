//
//  QiitaItemListViewDataSource.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/20.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit


class QiitaItemListViewDataSource: NSObject, UITableViewDataSource {
    
    private var data: [QiitaItem]
    private weak var tableView: UITableView?
    
    init(data: [QiitaItem], tableView: UITableView) {
        self.data = data
        self.tableView = tableView
        super.init()
    }
    
    func replaceData(itemList: [QiitaItem]) {
        self.data = itemList
        tableView?.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: QiitaItemCell = tableView.dequeueReusableCellWithIdentifier("QiitaItem", forIndexPath: indexPath) as! QiitaItemCell
        let item = data[indexPath.item]
        cell.titleView.text = item.title
        
        // この実装も高速スクロールしたときの課題が残っている
        cell.imageView?.load(item.user.profileImageUrl, placeholder: nil) { _ in
            cell.setNeedsLayout()
        }
        return cell
    }
    
}


