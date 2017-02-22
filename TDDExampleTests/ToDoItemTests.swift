//
//  ToDoItemTests.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-23.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest

@testable import TDDExample

class ToDoItemTests: XCTestCase {
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item =  ToDoItem(title:"Foo")
        XCTAssertEqual(item.title, "Foo", "should be set")
    }
    func test_Init_TakesTitleAndDescription() {
        let item = ToDoItem(title: "", itemDescription:"Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
    }
    func test_Init_WhenGivenTimestamp() -> Void {
        let item = ToDoItem(title: "", timestamp:0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should be set timestamp")
    }
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name:"Foo")
        let item = ToDoItem(title: "", location:location)
        XCTAssertEqual(item.location?.name, location.name, "Should set location")
    }
    func test_EqualItems_Equal() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        XCTAssertEqual(first, second)
    }
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))
        XCTAssertNotEqual(first, second)
        
    }
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
