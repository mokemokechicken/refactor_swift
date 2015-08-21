//
//  Module.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/19.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import UIKit

public protocol Module {
    func onLoad()
    func firstViewController() -> UIViewController?
}