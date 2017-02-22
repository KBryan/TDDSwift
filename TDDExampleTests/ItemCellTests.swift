//
//  ItemCellTests.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-26.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest

@testable import TDDExample

class ItemCellTests: XCTestCase {
    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: ItemCell!
    
    func test_HasNameLabel() {
     
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func test_ConfigCell_SetsLabelTexts() {
        

        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.reloadData()
        
       tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        let location = Location(name: "Bar")
        let item = ToDoItem(title: "Foo",
                                       itemDescription: nil,
                                       timestamp: 123456,
                                       location: location)
        cell.configCell(with: item)
        
        XCTAssertEqual(cell.titleLabel.text, "Foo")
        XCTAssertEqual(cell.labelLocation.text, "Bar")
        XCTAssertEqual(cell.dateLabel.text, "01/02/1970")
        
    }
    func test_HasLocationLabel() {
      
        XCTAssertNotNil(cell.labelLocation)
    }
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard
            .instantiateViewController(
                withIdentifier: "ItemListViewController")
            as! ItemListViewController
        _ = controller.view
        tableView = controller.tableView
        tableView?.dataSource = dataSource
       
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: IndexPath(row: 0, section: 0)) as! ItemCell
        tableView.reloadData()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}



extension ItemCellTests {
    class FakeDataSource:NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
