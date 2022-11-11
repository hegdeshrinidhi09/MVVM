//
//  ViewController.swift
//  MVVM
//
//  Created by Capgemini-DA078 on 10/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
var arrMovieVM = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getData()
    }
    
    func getData() {
        ApiService.shareInstance.getAllMovieData{ (movies, error) in
        if(error==nil) {
            
            self.arrMovieVM = movies?.map({ return MovieViewModel(movie: $0) }) ?? []
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let MVM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = MVM.artistName ?? ""
        cell.detailTextLabel?.text = MVM.trackName ?? ""
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
}
