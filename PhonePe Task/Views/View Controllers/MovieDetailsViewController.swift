//
//  MovieDetailsViewController.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    class var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var movie: Movie! // Dependency
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.title = movie.title
        tableView.dataSource = self
        tableView.register(MovieDetailsTableViewCell.nib, forCellReuseIdentifier: MovieDetailsTableViewCell.identifier)
        tableView.separatorStyle = .none
    }

}



extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailsTableViewCell.identifier) as! MovieDetailsTableViewCell
        cell.configure(with: movie)
        return cell
    }
}
