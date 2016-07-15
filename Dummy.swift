//
//  Dummy.swift
//  TableFavorite
//
//  Created by Erik Flores on 7/15/16.
//  Copyright © 2016 Orbis Ventures. All rights reserved.
//

import Foundation

enum FavoriteType:String {
    case Random
    case AllTrue
    case AllFalse
}

struct Dummy {
    
    var data:[Favorite] = [Favorite]()
    
    init(generateData favorite:FavoriteType) {
        
        switch favorite {
        case .Random:
            for item in 0..<20 {
                
                let tmpFavorite = Favorite()
                if item%3 == 0 || item%5 == 0 {
                    tmpFavorite.name = "Title"
                    tmpFavorite.favorite = "true"
                } else {
                    tmpFavorite.name = "Title"
                    tmpFavorite.favorite = "false"
                }
                self.data.append(tmpFavorite)
                
            }
            
        case .AllTrue:
            for _ in 0..<20 {
                let tmpFavorite = Favorite()
                tmpFavorite.name = "Title"
                tmpFavorite.favorite = "true"
                self.data.append(tmpFavorite)
            }
        case .AllFalse:
            for _ in 0..<50 {
                let tmpFavorite = Favorite()
                tmpFavorite.name = "Title"
                tmpFavorite.favorite = "false"
                self.data.append(tmpFavorite)
            }
        }
        
    }
    
}
