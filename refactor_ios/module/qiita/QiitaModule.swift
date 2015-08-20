//
//  QiitaModule.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit
import SwiftTask

class QiitaModule : Module{
    func onLoad() {
        let api = QiitaApiImpl(baseUrl: "https://qiita.com")
        let task = api.aa()
        
            
//            .success { (itemList: [QiitaItem]) -> Void in
//            println(itemList)
//            return 
//        }
    }
 
    func firstViewController() -> UIViewController? {
        let sb = UIStoryboard(name: "Qiita", bundle: NSBundle.mainBundle())
        return sb.instantiateInitialViewController() as? UIViewController
    }
}
