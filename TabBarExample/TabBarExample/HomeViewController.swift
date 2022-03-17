//
//  HomeViewController.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var movies: [Movie] = []

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchTopMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetails" {
            if let destinationViewController = segue.destination as? MovieDetailsViewController, let movie = sender as? Movie {
                destinationViewController.movie = movie
            }
        }
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let topMovieCell = UINib(nibName: TopMovieTableViewCell.identifier, bundle: nil)
        tableView.register(topMovieCell, forCellReuseIdentifier: TopMovieTableViewCell.identifier)
        
    }
    
    private func fetchTopMovies() {
        movies = Movie.getMovies()
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopMovieTableViewCell.identifier, for: indexPath) as? TopMovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "showMovieDetails", sender: movie)
    }
    
}
