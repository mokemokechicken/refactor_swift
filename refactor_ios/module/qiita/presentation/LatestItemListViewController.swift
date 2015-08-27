//
//  LatestViewController.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit
import ImageLoader

class LatestItemListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    private var tableViewAdapter: QiitaItemListViewAdapter!
    private var model: LatestItemListModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = modelContainer.get(LATEST_ITEM_LIST_MODEL)
        
        tableViewAdapter = QiitaItemListViewAdapter(data: [], tableView: tableView)
        tableView.dataSource = tableViewAdapter
        tableView.delegate = self

        self.model.update()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateView()
        self.model.eventCenter.register(self, handler: onUpdate)
    }
    
    func onUpdate(event: LatestItemListModel.UpdateEvent) {
        self.updateView()
    }
    
    func updateView() {
        self.tableViewAdapter.replaceData(self.model.items)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.model.eventCenter.unregister(self)
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
