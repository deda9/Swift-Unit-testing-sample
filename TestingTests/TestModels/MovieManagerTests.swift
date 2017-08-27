//
//  MovieManagerTests.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import XCTest
@testable import Testing

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMoviesToSeeCount_ShouldReturnZero(){
        XCTAssertEqual(sut.moviesToSee, 0)
    }
    
    func testMoviesIsSeenCount_ShouldReturnZero(){
        XCTAssertEqual(sut.moviesIsSeen, 0)
    }
    
    func testMoviesToSeeCount_ShouldBeOneAfterMovieIsAdded(){
        let movie = Movie(title: "Super Man")
        sut.addMovieToSee(movie)
        XCTAssertEqual(sut.moviesToSee, 1)
    }
    
    func testMovieAtIndex_ShouldReturnLastMovieIsAdded(){
        let movie = Movie(title: "Wonder Woman")
        sut.addMovieToSee(movie)
        
        let returnedMovie = sut.movieAtIndex(0)
        XCTAssertEqual(movie.title, returnedMovie.title)
    }
    
    func testFavoriteMovie_ShouldDecreaseMoviesToSeeCount(){
        let movie1 =  Movie(title: "Super Man")
        let movie2 =  Movie(title: "Wonder Woman")
        
        sut.addMovieToSee(movie1)
        sut.addMovieToSee(movie2)
        
        XCTAssertEqual(sut.moviesToSee , 2)
        sut.favoriteMovieAtIndex(0)
        
        XCTAssertEqual(sut.moviesToSee , 1)
    }
    
    func testFavoriteMovie_ShouldIncreaseMoviesIsSeenCount(){
        let movie1 =  Movie(title: "Super Man")
        let movie2 =  Movie(title: "Wonder Woman")
        
        sut.addMovieToSee(movie1)
        sut.addMovieToSee(movie2)
        sut.favoriteMovieAtIndex(0)
        
        XCTAssertEqual(sut.moviesIsSeen , 1)
    }
    
    func testFavoriteMovie_ShouldRemoveMovieFromMoviesToSeeArray(){
        let movie1 =  Movie(title: "Super Man")
        let movie2 =  Movie(title: "Wonder Woman")
        
        sut.addMovieToSee(movie1)
        sut.addMovieToSee(movie2)
        sut.favoriteMovieAtIndex(0)
        
        let returnedMovie = sut.movieAtIndex(0)
        XCTAssertEqual(returnedMovie.title, movie2.title)
    }
    
    func testFavoriteMovieAtIndex_ShouldReturnFavoriteMovie(){
        let movie1 =  Movie(title: "Super Man")
        let movie2 =  Movie(title: "Wonder Woman")
        
        sut.addMovieToSee(movie1)
        sut.addMovieToSee(movie2)
        sut.favoriteMovieAtIndex(0)
        
        let favoriteMovie = sut.getFavoriteMovieAtIndex(0)
        XCTAssertEqual(favoriteMovie.title, movie1.title)
    }
    
    func testRemoveAllArrays_ShouldResturnZeroForBoth(){
        let movie1 =  Movie(title: "Super Man")
        let movie2 =  Movie(title: "Wonder Woman")
        
        sut.addMovieToSee(movie1)
        sut.addMovieToSee(movie2)
        
        sut.favoriteMovieAtIndex(0)
        XCTAssertEqual(sut.moviesToSee, 1)
        XCTAssertEqual(sut.moviesIsSeen, 1)
        
        sut.clearAllArrays()
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesIsSeen, 0)

    }

}
