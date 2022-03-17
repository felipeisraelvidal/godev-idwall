//
//  CategoryCollectionViewCell.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public methods
    
    func configure(with model: Category) {
        nameLabel.text = model.rawValue
    }

}
