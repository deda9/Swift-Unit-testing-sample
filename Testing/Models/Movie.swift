//
//  Movie.swift
//  Testing
//
//  Created by Bassem Anwer on 8/24/17.
//  Copyright © 2017 Bassem Anwer. All rights reserved.
//

import Foundation

struct Movie: Equatable{
    var title: String
    var releaseDate : String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static func== (lhs: Movie, rhs: Movie) -> Bool{
        if(lhs.title != rhs.title || lhs.releaseDate != rhs.releaseDate){
            return false
        }
        return true
    }
}
