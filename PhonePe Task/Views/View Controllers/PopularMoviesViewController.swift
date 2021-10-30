//
//  PopularMoviesViewController.swift
//  PhonePe Task
//
//  Created by Dheeraj Bhavsar on 30/10/21.
//

import UIKit
import MBProgressHUD

class PopularMoviesViewController: UIViewController {
    
    class var identifier: String {
        String(describing: self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let service = MovieDBService()
    
    private var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchData()
    }
    
    private func setupViews() {
        self.title = "Popular"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
    private func fetchData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        service.fetchPopularMovies { [unowned self] movies in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                guard let movies = movies else {
                    self.showError()
                    return
                }
                if (movies.isEmpty) {
                    self.showError(with: "No movies found")
                } else {
                    self.movies = movies
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension PopularMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}

extension PopularMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: MovieDetailsViewController.identifier) as? MovieDetailsViewController else { return }
        detailsVC.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension UIViewController {
    func showError(with message: String = "Something went wrong") {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
