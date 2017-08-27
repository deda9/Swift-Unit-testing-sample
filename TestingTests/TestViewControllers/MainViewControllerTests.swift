//
//  MainViewControllerTests.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import XCTest
import UIKit

@testable import Testing
class MainViewControllerTests: XCTestCase {
    
    var sut: MainViewController!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMainVC_tableViewShouldNotNil(){
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewDidLoad_TableDataSourceNotNUll(){
        let tableView = sut.tableView
        XCTAssertNotNil(tableView?.dataSource)
    }
    
    func testViewDidLoad_TableDataSourceIsTypeOfMoviesDataSource(){
        let tableView = sut.tableView
        XCTAssertTrue(tableView?.dataSource is MoviesTableDataSource)
    }
    
    func testViewDidLoad_TableViewDelegetNotNull(){
        let tableView = sut.tableView
        XCTAssertNotNil(tableView?.delegate)
    }
    
    func testViewDidLoad_TableDelegateIsTypeOfMoviesDataSource(){
        let tableView = sut.tableView
        XCTAssertTrue(tableView?.delegate is MoviesTableDataSource)
    }
    
    func testViewDidLoad_ShouldTableViewDelegateAndDataSourceTheSameType(){
        let delegate = sut.tableView.delegate as! MoviesTableDataSource
        let dataSource = sut.tableView.dataSource as! MoviesTableDataSource
        XCTAssertEqual(dataSource, delegate)
    }
    
}
