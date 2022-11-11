//
//  ApiService.swift
//  MVVM
//
//  Created by Capgemini-DA078 on 10/11/22.
//

import UIKit

class ApiService: NSObject {
    
    static let shareInstance = ApiService()

    func getAllMovieData(completion: @escaping([MovieModel]?, Error?) -> ()){
        
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Loading data error: \(err.localizedDescription)")
            } else {
                guard let data = data else { return}
                do {
                    var arrMovieData = [MovieModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    
                    for movie in results.results{
                        arrMovieData.append(MovieModel(artistName: movie.artistName!, trackName: movie.trackName!))
                    }
                    completion(arrMovieData, nil)
                   // print(arrMovieData)
                } catch let jsonErr {
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
