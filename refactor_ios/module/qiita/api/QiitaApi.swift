//
//  QiitaApi.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/20.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

import Argo
import Runes
import SwiftTask


protocol QiitaApi {
    func getLatestItems() -> Task<Float, [QiitaItem], NSError>
    func getItemsByTag(tag: String) -> Task<Float, [QiitaItem], NSError>
}

// Argo: https://github.com/thoughtbot/Argo
// 日本語の説明: http://qiita.com/koher/items/300d89136b515291dac4
extension QiitaItem: Decodable {
    static func create(id: String)(title: String)(url: String)(user: QiitaUser) -> QiitaItem {
        return QiitaItem(id: id, title: title, url: url, user: user)
    }
    
    static func decode(json: JSON) -> Decoded<QiitaItem> {
        return QiitaItem.create
            <^> json <| "id"
            <*> json <| "title"
            <*> json <| "url"
            <*> json <| "user"
    }
}

extension QiitaUser: Decodable {
    
    static func create(id: String)(name: String)(profileImageUrl: String) -> QiitaUser {
        return QiitaUser(id: id, name: name, profileImageUrl: profileImageUrl)
    }
    
    static func decode(json: JSON) -> Decoded<QiitaUser> {
        return QiitaUser.create
            <^> json <| "id"
            <*> json <| "name"
            <*> json <| "profile_image_url"
    }
}


