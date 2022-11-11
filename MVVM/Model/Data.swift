//
//  File.swift
//  MVVM
//
//  Created by Capgemini-DA078 on 10/11/22.
//

import Foundation

class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName: String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
    }
}

class ResultsModel: Decodable {
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
     
}
