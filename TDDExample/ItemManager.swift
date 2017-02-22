//
//  ItemManager.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-23.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import Foundation

class ItemManager {
    //
    var toDoCount:Int  { return toDoItems.count }

    var doneCount:Int { return doneItems.count }
    
    
    private var toDoItems:[ToDoItem] = []
    private var doneItems:[ToDoItem] = []
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
    func uncheckItem(at index:Int) {
        let item = doneItems.remove(at: index)
        toDoItems.append(item)
    }
    
    func add(_ item:ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
        print("Total Count of Items \(toDoItems.count)")

    }
    func item(at index:Int) -> ToDoItem {

        return toDoItems[index]
    }
    func checkItem(at index:Int) {
        
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    func doneItem(at index:Int) -> ToDoItem {
        if doneItems.indices.contains(index) {
            return doneItems[index]
        }
        return doneItems[index]
    }
}
extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
