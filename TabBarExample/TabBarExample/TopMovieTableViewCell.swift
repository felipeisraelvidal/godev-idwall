//
//  TopMovieTableViewCell.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class TopMovieTableViewCell: UITableViewCell {

    static let identifier = "TopMovieTableViewCell"
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    // MARK: - Public methods
    
    func configure(with model: Movie) {
        
        posterImageView.image = UIImage(named: model.imageName)
        
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        categoryLabel.text = model.category.rawValue
        durationLabel.text = "\(model.duration) min"
        
    }
    
}
