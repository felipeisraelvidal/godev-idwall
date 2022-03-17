//
//  AboutTableViewCell.swift
//  TabBarExample
//
//  Created by SP12442 on 17/03/22.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    static let identifier = "AboutTableViewCell"
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.numberOfLines = 0
    }
    
}
