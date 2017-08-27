//
//  ViewController.swift
//  Testing
//
//  Created by Bassem Anwer on 8/23/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableDataSource: MoviesTableDataSource!
    lazy var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieManager.moviesToSeeArray = [Movie.init(title: "Moive1", releaseDate: "22-3-1990"),
        Movie.init(title: "Moive2", releaseDate: "22-3-1990"),
        Movie.init(title: "Moive3", releaseDate: "22-3-1990"),
        Movie.init(title: "Moive4", releaseDate: "22-3-1990"),
        Movie.init(title: "Moive5", releaseDate: "22-3-1990")]
        movieManager.moviesIsSeenArray = [Movie.init(title: "Moive6", releaseDate: "22-3-1990")]
        tableDataSource.movieManager = movieManager
        self.tableView.dataSource = tableDataSource
        self.tableView.delegate = tableDataSource
    }
}

