//
//  ItemListDataProviderTests.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-25.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest

@testable import TDDExample

class ItemListDataProviderTests: XCTestCase {
    var sut:ItemListDataProvider!
    var controller:ItemListViewController!
    var tableView:UITableView!
    func test_NumberOFSections_IsTwo() {
    
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    func test_NumberOfRows_InFirstSection_IsToDoCount() {
        
        tableView.dataSource = sut
        // Add First Item
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()

        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()

        // Add Second Item
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
    }
    
    func test_NumberOfRows_InSecondSection_IsToDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        sut.itemManager?.checkItem(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        tableView.reloadData()

        sut.itemManager?.add(ToDoItem(title: "Bar"))
        sut.itemManager?.checkItem(at: 0)
        print("To do count \(sut.itemManager?.toDoCount)")
        tableView.reloadData()

        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) 
        XCTAssertTrue(cell is ItemCell)
    }
    func test_CellForRow_DequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        mockTableView.dataSource = sut
        //mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        sut.itemManager?.add(ToDoItem(title:"Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    override func setUp() {
        super.setUp()
        sut = ItemListDataProvider()
    
        sut.itemManager = ItemManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        _ = controller.view
        tableView = controller.tableView
        tableView.dataSource = sut

    }
    func test_CheckingAnItem_ChecksItInTheItemManager() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(sut.itemManager?.toDoCount, 0)
        XCTAssertEqual(sut.itemManager?.doneCount, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    func test_DeleteButton_InSecondSection_ShowsTitleUncheck() {
        let deleteButtonTitle = tableView.delegate?.tableView!(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(deleteButtonTitle, "Uncheck")
    }
    func test_DeleteButton_InFirstSection_ShowsTitleCheck() {
        let deleteButtonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(deleteButtonTitle, "Check")
    }
    func test_CellForRow_InSectionTwo_CallsConfigCellWithDoneItem() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self , forCellReuseIdentifier: "ItemCell")
        
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()

        let second = ToDoItem(title: "Bar")
        sut.itemManager?.add(second)
        sut.itemManager?.checkItem(at: 1)

        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        XCTAssertEqual(cell.catchedItem, second)
    }
    func test_CellForRow_CallsConfigCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self , forCellReuseIdentifier: "ItemCell")
        let item = ToDoItem(title: "Foo")
        sut.itemManager?.add(item)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        XCTAssertEqual(cell.catchedItem,item)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
extension ItemListDataProviderTests {
    class MockTableView:UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier , for: indexPath)
        }
        class func mockTableView(
            withDataSource dataSource: UITableViewDataSource)
            -> MockTableView {
                let mockTableView = MockTableView(
                    frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                    style: .plain)
                mockTableView.dataSource = dataSource
                mockTableView.register(MockItemCell.self,
                                       forCellReuseIdentifier: "ItemCell")
                return mockTableView
        }
    }
    class MockItemCell : ItemCell {
        var catchedItem:ToDoItem?
        
        override func configCell(with item:ToDoItem) {
            catchedItem = item
        }
    }
}

