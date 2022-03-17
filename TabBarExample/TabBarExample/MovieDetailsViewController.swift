//
//  MovieDetailsViewController.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var labelsVisualEffectView: UIVisualEffectView!
    
    var movie: Movie?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            configure(with: movie)
        }
        
        labelsVisualEffectView.layer.cornerRadius = 16
        labelsVisualEffectView.clipsToBounds = true
    }
    
    // MARK: - Private methods
    
    private func configure(with movie: Movie) {
        
        posterImageView.image = UIImage(named: movie.imageName)
        
        nameLabel.text = movie.name
        descriptionLabel.text = movie.description
        
    }

}
