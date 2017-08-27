//
//  MovieCellTests.swift
//  Testing
//
//  Created by Bassem Anwer on 8/27/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import XCTest
import UIKit

@testable import Testing
class MovieCellTests: XCTestCase {
    
    var dataSource: MoviesTableDataSourceMock!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        _ = mainViewController.view
        tableView = mainViewController.tableView
        dataSource = MoviesTableDataSourceMock()
        tableView.dataSource = dataSource
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCellData_ShouldSetTitleToMovieTitle(){
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: IndexPath(row: 0, section: 0)) as! MovieCell
        let movie = Movie(title: "wondar wonman")
        cell.setCellData(movie)
        XCTAssertEqual(cell.textLabel?.text, movie.title)
    }
    
}
