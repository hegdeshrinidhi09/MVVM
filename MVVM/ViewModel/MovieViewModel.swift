//
//  Parse.swift
//  MVVM
//
//  Created by Capgemini-DA078 on 10/11/22.
//

import Foundation
class MovieViewModel: NSObject {
    var artistName: String?
    var trackName: String?
    
    //Dependency Injection
    
    init(movie:MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
