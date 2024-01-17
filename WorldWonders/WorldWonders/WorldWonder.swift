//
//  WorldWonder.swift
//  WorldWonders
//
//  Created by РАХАТ  on 10.01.2024.
//

import Foundation
import SwiftyJSON

struct WorldWonder{
    
    var name = ""
    var region = ""
    var location = ""
    var flag = ""
    var picture = ""
    
    init(json: JSON){
        if let item = json["name"].string {
            name = "Достопримечательность: \(item)"
        }
        if let item = json["region"].string {
            region = "Регион: \(item)"
        }
        if let item = json["location"].string {
            location = item
        }
        if let item = json["flag"].string {
            flag = item
        }
        if let item = json["picture"].string {
            picture = item
        }
    }
}
