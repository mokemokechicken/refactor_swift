//
//  TagViewController.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit

class TagItemListViewController: UIViewController,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewAdapter: QiitaItemListViewAdapter!
    private var model: LatestItemListModel! = modelContainer.get(LATEST_ITEM_LIST_MODEL)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAdapter = QiitaItemListViewAdapter(data: [], tableView: tableView)
        tableView.dataSource = tableViewAdapter
        tableView.delegate = self
        
        let api = QiitaApiImpl(baseUrl: "https://qiita.com")
        // この場合 unowned だとCrashする。
        api.getItemsByTag("iOS").success { [unowned self] itemList in
            self.tableViewAdapter.replaceData(itemList)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let item = tableViewAdapter.get(indexPath.item) {
            if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ItemDetail") as? ItemDetailViewController {
                vc.itemUrl = item.url
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}
