//
//  MovieCell.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCellData(_ movie: Movie){
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }
    
}
