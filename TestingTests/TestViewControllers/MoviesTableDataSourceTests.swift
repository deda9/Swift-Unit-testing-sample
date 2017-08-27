//
//  MoviesTableDataSourceTests.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import XCTest
import UIKit

@testable import Testing
class MoviesTableDataSourceTests: XCTestCase {
    
    var sut: MoviesTableDataSource!
    var tableView: UITableView!
    var mainViewController: MainViewController!
    
    override func setUp() {
        super.setUp()
        sut = MoviesTableDataSource()
        sut.movieManager = MovieManager()
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        _ = mainViewController.view
        tableView = mainViewController.tableView
        tableView.delegate = sut
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableViewSectionCount_ShouldReturnTwo(){
        let sectionCount = tableView.numberOfSections
        XCTAssertEqual(sectionCount, 2)
    }
    
    func testNumberOfRowsInSectionOne_ShouldEqualMoviesToSeeCount(){
        let movie = Movie(title: "Super man back")
        let movie2 = Movie(title: "Super man back2")
        sut.movieManager?.addMovieToSee(movie)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.movieManager?.moviesToSee)
        sut.movieManager?.addMovieToSee(movie2)
        sut.movieManager?.addMovieToSee(movie2)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.movieManager?.moviesToSee)
    }
    
    func testNumberOfRowsInSectionTWO_ShouldEqualMoviesIsSeenCount(){
        let movie = Movie(title: "Super man back")
        sut.movieManager?.addMovieToSee(movie)
        sut.movieManager?.favoriteMovieAtIndex(0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), sut.movieManager?.moviesIsSeen)
    }
    
    func testTableViewCell_ShouldReturnMovieCell(){
        let movie = Movie(title: "Super man back")
        sut.movieManager?.addMovieToSee(movie)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))
        XCTAssertTrue(cell is MovieCell)
    }
    
    func testTableViewCell_ShouldReturnCellWithDequeue(){
        let tableView = TableViewMock.intializeTableViewMock()
        tableView.delegate = sut
        tableView.dataSource = sut
        
        let movie = Movie(title: "Super man back")
        sut.movieManager?.addMovieToSee(movie)
        
        tableView.reloadData()
        _ = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))
        XCTAssertTrue(tableView.cellIsDeueued)
    }
    
    func testCellUpdateData_ShouldSetDataProberly(){
        let tableView = TableViewMock.intializeTableViewMock()
        tableView.dataSource = sut
        
        let movie = Movie(title: "Super man")
        let movie2 = Movie(title: "Super man2")
        
        sut.movieManager?.addMovieToSee(movie)
        sut.movieManager?.addMovieToSee(movie2)
        sut.movieManager?.favoriteMovieAtIndex(0)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movie, movie)
    }
    
    func testFavoriteMovie_ShouldFavoriteMovieDidSelectAtRow(){
        let movie = Movie(title: "Super man")
        let movie2 = Movie(title: "Super man2")

        sut.movieManager?.addMovieToSee(movie)
        sut.movieManager?.addMovieToSee(movie2)
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesIsSeen, 1)
        XCTAssertEqual(sut.movieManager?.moviesToSee, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionsTitle_ShouldReturnWithCorrretValues(){
        let section1Title = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 0)
        let section2Title = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies to see")
        XCTAssertEqual(section2Title, "Movies is Seen")
    }
}


