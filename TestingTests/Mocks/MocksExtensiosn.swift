//
//  MocksExtensiosn.swift
//  Testing
//
//  Created by Bassem Anwer on 8/27/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import Foundation
import UIKit

@testable import Testing
extension MoviesTableDataSourceTests{
    class TableViewMock: UITableView{
        var cellIsDeueued: Bool = false
        
        override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
            cellIsDeueued = true
            return super.dequeueReusableCell(withIdentifier: identifier)
        }
        
        class func intializeTableViewMock() -> TableViewMock{
            let tableViewMock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            tableViewMock.register(MovieCellMock.self, forCellReuseIdentifier: "MovieCell")
            return tableViewMock
        }
    }
    
    class MovieCellMock: MovieCell{
        var movie: Movie?
        
        override func setCellData(_ movie: Movie){
            self.movie = movie
        }
    }
}

extension MovieCellTests{
    class MoviesTableDataSourceMock : NSObject, UITableViewDataSource{
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
