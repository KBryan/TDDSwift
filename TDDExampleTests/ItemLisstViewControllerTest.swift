//
//  ItemLisstViewControllerTest.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-25.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import XCTest

@testable import TDDExample

class ItemLisstViewControllerTest: XCTestCase {
    
    var sut = ItemListViewController()
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }
    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController
        _ = sut.view

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
