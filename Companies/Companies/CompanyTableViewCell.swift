//
//  CompanyTableViewCell.swift
//  Companies
//
//  Created by SP12442 on 14/03/22.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    static let identifier = "CompanyTableViewCell"
    
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoImageView.layer.cornerRadius = 25
        logoImageView.clipsToBounds = true
    }

    func configure(with model: Company) {
        logoImageView.image = UIImage(named: model.imageName)
        
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }

}
