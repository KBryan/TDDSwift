//
//  ToDoItem.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-23.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import Foundation

struct ToDoItem : Equatable {
    let title:String?
    let itemDescription:String?
    let timestamp:Double?
    let location:Location?
    
    init(title:String,
         itemDescription:String? = nil,
         timestamp:Double? = nil,
         location:Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}
func ==(lhs:ToDoItem,rhs:ToDoItem) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
    if lhs.location != lhs.location {
        return false
    }
    if lhs.location?.name != rhs.location?.name {
        return false
    }
    return true
}
