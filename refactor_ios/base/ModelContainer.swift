//
//  ModelContainer.swift
//  refactor_ios
//
//  Created by 森下 健 on 2015/08/20.
//  Copyright (c) 2015年 Yumemi. All rights reserved.
//

public let modelContainer = ModelContainer()

public class ModelContainer {
    private var container = [String: Any]()
    
    public func get<T: AnyObject>(modelKey: String) -> T? {
        return container[modelKey] as? T
    }
    
    public func setModel(model: AnyObject, forKey key: String) {
        container[key] = model
    }
    
}
