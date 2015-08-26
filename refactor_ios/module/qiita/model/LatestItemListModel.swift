//
//  LatestItemListModel.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/25.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import Foundation

let LATEST_ITEM_LIST_MODEL = "LATEST_ITEM_LIST_MODEL"


class LatestItemListModel {
    
    
}


protocol Observable<T: AnyObject> {
    func addObserver(observer: T)
    
}