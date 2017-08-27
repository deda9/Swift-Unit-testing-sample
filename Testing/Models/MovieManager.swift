//
//  MovieManager.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import UIKit

class MovieManager {
    
    var moviesToSee: Int {return moviesToSeeArray.count}
    var moviesIsSeen: Int {return moviesIsSeenArray.count}
    
    var moviesToSeeArray = [Movie]()
    var moviesIsSeenArray = [Movie]()

    func addMovieToSee(_ movie: Movie){
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex(_ index: Int) -> Movie{
        let movie = moviesToSeeArray[index]
        return movie
    }
    
    func favoriteMovieAtIndex(_ index: Int){
        guard index < moviesToSee else {
            return
        }
        let movie = moviesToSeeArray.remove(at: index)
        moviesIsSeenArray.append(movie)
    }
    
    func getFavoriteMovieAtIndex(_ index: Int) -> Movie{
        let movie = moviesIsSeenArray[index]
        return movie
    }
 
    
    func clearAllArrays(){
        moviesIsSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}
