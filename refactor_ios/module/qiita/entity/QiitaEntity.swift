//
//  QiitaEntity.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/20.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

struct QiitaItem {
    let id: String
    let title: String
    let url: String
    let user: QiitaUser
}

struct QiitaUser {
    let id: String
    let name: String
    let profileImageUrl: String
}


