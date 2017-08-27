//
//  MovieTests.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import XCTest
@testable import Testing

class MovieTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit_setMovieTitle(){
        let movie = Movie(title: "Deam Maker")
        XCTAssertEqual(movie.title, "Deam Maker")
    }
    
    func testInit_setMovieTitleWithReleaseData(){
        let movie = Movie(title: "Deam Maker", releaseDate: "2-2-1889")
        XCTAssertEqual(movie.releaseDate
            , "2-2-1889")
    }
    
    func testMoviesAreEqual_ShouldReturnTrue(){
        let movie = Movie(title: "Deam Maker")
        let movie2 = Movie(title: "Deam Maker")
        XCTAssertEqual(movie, movie2)
    }
    
    func testMovieAreEqualWithDifferentReleaseData_ShouldReturnFalse(){
        let movie = Movie(title: "Deam Maker", releaseDate: "5-2-1889")
        let movie2 = Movie(title: "Deam Maker", releaseDate: "2-2-1889")
        XCTAssertNotEqual(movie, movie2)
    }
    
    func testMovieAreEqualWithSameReleaseData_ShouldReturnTrue(){
        let movie = Movie(title: "Deam Maker", releaseDate: "2-2-1889")
        let movie2 = Movie(title: "Deam Maker", releaseDate: "2-2-1889")
        XCTAssertEqual(movie, movie2)
    }
}
