//
//  CategoryMoviesViewController.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class CategoryMoviesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var category: Category?
    
    private var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let category = category {
            configure(with: category)
        }
        
        configureTableView()
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

    private func configure(with category: Category) {
        title = category.rawValue
        
        let allMovies = Movie.getMovies()
        movies = allMovies.filter({ $0.category == category })
    }
    
    private func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let movieCell = UINib(nibName: TopMovieTableViewCell.identifier, bundle: nil)
        tableView.register(movieCell, forCellReuseIdentifier: TopMovieTableViewCell.identifier)
        
    }
    
}

extension CategoryMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
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
