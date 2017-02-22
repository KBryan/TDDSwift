//
//  ItemManagerTests.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-23.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest

@testable import TDDExample

class ItemManagerTests: XCTestCase {
    var sut:ItemManager!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemManager()

    }
    func test_Add_WhenItemIsAlreadyAdded_DoesNotIncreaseCount() {
        sut.add(ToDoItem(title: "Foo"))
        sut.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(sut.toDoCount, 1)
    }
    func test_RemoveAll_ResultsInCountsBeZero() {

        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
        
        sut.removeAll()
    }
    func test_ToDoCount_Initially_IsZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
    func test_DoneCount_Initially_IsZero() {
        XCTAssertEqual(sut.doneCount, 0)
    }
    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: ""))
        XCTAssertEqual(sut.toDoCount, 1)
    }
    func test_ItemAt_AfterAddingAnItem_ReturnsThatItem() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        let returnedItem = sut.item(at:0)
        XCTAssertEqual(returnedItem.title, item.title)
    }
    func test_CheckItemAt_ChangesCount() {
        sut.add(ToDoItem(title: ""))
        sut.checkItem(at: 0)
    }
    func test_DoneItemAt_ReturnsCheckedItem() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        sut.checkItem(at: 0)
        let returnedItem = sut.doneItem(at:0)
        XCTAssertEqual(returnedItem.title, item.title)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
