//
//  TransitionManager.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit

public class TransitionManager {
    private let appDelegate : UIApplicationDelegate
    
    init(app: UIApplicationDelegate) {
        appDelegate = app
    }
    
    func setToRoot(module: Module) {
        if let vc = module.firstViewController(), window = appDelegate.window {
            window?.rootViewController = vc
        }
    }
}
