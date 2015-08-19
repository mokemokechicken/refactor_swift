//
//  QiitaModule.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit

class QiitaModule : Module{
    func onLoad() {
        
    }
 
    func firstViewController() -> UIViewController? {
        let sb = UIStoryboard(name: "Qiita", bundle: NSBundle.mainBundle())
        return sb.instantiateInitialViewController() as? UIViewController
    }
}
