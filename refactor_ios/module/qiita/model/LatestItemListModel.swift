//
//  LatestItemListModel.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/25.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import Foundation
import EventCenter

let LATEST_ITEM_LIST_MODEL = "LATEST_ITEM_LIST_MODEL"


class LatestItemListModel {
    class UpdateEvent {}
    
    let eventCenter: EventCenter
    private(set) var items: [QiitaItem] = []
    
    init(eventCenter: EventCenter) {
        self.eventCenter = eventCenter
    }
    
    func update() {
        qiitaApi.getLatestItems().success { itemList -> Void in
            self.items = itemList
            self.eventCenter.post(UpdateEvent())
        }
    }
    
}





