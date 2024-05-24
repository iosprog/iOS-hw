//
//  Movies.swift
//  MoviesApp
//
//  Created by РАХАТ  on 31.01.2024.
//

import Foundation
import SwiftyJSON

struct Movies {
    var MovieName = ""
    var MovieImage = ""
    var MovieGenre = ""
    
    init(json: JSON) {
        if let item = json["MovieName"].string {
            MovieName = item
        }
        if let item = json["MovieImage"].string {
            MovieImage = item
        }
        if let item = json["MovieGenre"].string {
            MovieGenre = item
        }
    }
}
