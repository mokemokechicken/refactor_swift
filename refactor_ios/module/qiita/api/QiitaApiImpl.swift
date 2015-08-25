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
    let baseUrl: String
    
    required init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getLatestItems() -> Task<Float, [QiitaItem], NSError> {
        let request = Alamofire.request(.GET, "\(baseUrl)/api/v2/items")
        return request.toEntityListTask()  // Return の型 [QiitaItem] によって実行される処理が選択されている
    }
    
    func getItemsByTag(tag: String) -> Task<Float, [QiitaItem], NSError> {
        let request = Alamofire.request(.GET, "\(baseUrl)/api/v2/tags/ios/items")
        return request.toEntityListTask()  // Return の型 [QiitaItem] によって実行される処理が選択されている
    }

}

extension Request {
    func toEntityListTask<T: Decodable where T == T.DecodedType>() -> Task<Float, [T], NSError> {
        let task = Task<Float, [T], NSError> { progress, fulfill, reject, configure in  // この辺は SwiftTask
            self.response { req, res, data, error in
                if let err = error {
                    reject(err)
                    return
                }
                if let responseData = data {
                    var jsonError: NSError?
                    let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions(0), error: &jsonError)
                    if let j: AnyObject = json {
                        let decoded: Decoded<[T]> = decode(j)  // この辺が Argo
                        switch(decoded) {
                        case .Success(let box):
//                          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                              fulfill(box.value)
//                          }
                        case .MissingKey(let s):
                            reject(NSError(domain: s, code: 0, userInfo: nil))
                        case .TypeMismatch(let s):
                            reject(NSError(domain: s, code: 0, userInfo: nil))
                        }
                    } else {
                        reject(jsonError!)
                    }
                } else {
                    reject(NSError(domain: "API Response Error: No Data", code: -1, userInfo: nil))
                }
            }
            return
        }
        return task
    }

    /*
    余談

    func toEntityTask<T: Decodable where T == T.DecodedType>() -> Task<Float, T, NSError> { ... }
    
    が欲しくなったときに、ほとんど toEntityListTaskのコピペになってしまう。
    Closure部分を外出しすれば良いけど、引数がGenericsだらけで結構しんどい。。
    
    */
    
    /*
    Argo, Alamofire, SwiftTask は 型にハマれば結構便利に使えそう。 AndroidのRetrofitみたいになる。
    */
}

