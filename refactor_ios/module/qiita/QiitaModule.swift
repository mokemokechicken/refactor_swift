//
//  QiitaModule.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit
import SwiftTask


var qiitaApi: QiitaApi!


class QiitaModule : Module{
    func onLoad() {
        qiitaApi = QiitaApiImpl(baseUrl: "https://qiita.com")
        qiitaApi.getLatestItems().success {itemList in
            println(itemList)
        }
        
    }
 
    func firstViewController() -> UIViewController? {
        let sb = UIStoryboard(name: "Qiita", bundle: NSBundle.mainBundle())
        return sb.instantiateInitialViewController() as? UIViewController
    }
}
