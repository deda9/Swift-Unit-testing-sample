//
//  MoviesTableDataSource.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import Foundation
import UIKit

enum MovieSections: Int{
    case MoviesToSeen, MoviesIsSeen
}

class MoviesTableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }
        guard let moviesSecion = MovieSections.init(rawValue: section) else { fatalError() }
        
        if(moviesSecion == .MoviesToSeen){
            return movieManager.moviesToSee
        }else if (moviesSecion == .MoviesIsSeen){
            return movieManager.moviesIsSeen
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        guard let movieManager = movieManager else { fatalError() }
        guard let moviesSecion = MovieSections.init(rawValue: indexPath.section) else { fatalError() }
        
        let currentMovie = moviesSecion.rawValue == 0 ? movieManager.moviesToSeeArray[indexPath.row] : movieManager.moviesIsSeenArray[indexPath.row]
        
        cell.setCellData(currentMovie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let moviesSecion = MovieSections.init(rawValue: indexPath.section) else { fatalError() }
        
        if(moviesSecion == .MoviesToSeen){
            movieManager.favoriteMovieAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let moviesSecion = MovieSections.init(rawValue: section) else { fatalError() }

        if(moviesSecion.rawValue == 0){
            return "Movies to see"
        }else{
            return "Movies is Seen"
        }
    }
}
