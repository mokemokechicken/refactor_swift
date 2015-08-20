//
//  QiitaApiImpl.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/20.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//


import Argo
import Alamofire
import SwiftTask

class QiitaApiImpl : QiitaApi {
    typealias Progress = (bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)

    let baseUrl: String
    
    required init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getLatestItems() -> [QiitaItem] {
        Alamofire.request(.GET, "\(baseUrl)/api/v2/items")
            .responseJSON { request, response, json, error in
                println(json)
            }
        
        return []
    }
    
    func getItemsByTag(tag: String) -> [QiitaItem] {
        return []
    }
    
    func aa() -> Task<Progress, [QiitaItem], NSError> {
        let task = Task<Progress, [QiitaItem], NSError> { progress, fulfill, reject, configure in
            Alamofire.request(.GET, "\(baseUrl)/api/v2/items")
                .response { _, response, data, error in
                    if let err = error {
                        reject(err)
                    } else {
                        if let responseData = data {
                            var jsonError: NSError?
                            let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions(0), error: &jsonError)
                            if let err = jsonError {
                                reject(err)
                            } else if let j: AnyObject = json {
                                let decoded: Decoded<[QiitaItem]> = decode(j)
                                switch(decoded) {
                                case .MissingKey(let s):
                                    reject(NSError())
                                case .Success(let box):
                                    fulfill(box.value)
                                case .TypeMismatch(let s):
                                    reject(NSError())
                                }
                            } else {
                                reject(NSError())
                            }
                        } else {
                            reject(NSError())
                        }
                    }
            }
        }
        return task
    }

    
}


