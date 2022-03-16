//
//  CompanyDetailsViewController.swift
//  Companies
//
//  Created by SP12442 on 15/03/22.
//

import UIKit

class CompanyDetailsViewController: UIViewController {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var company: Company?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let company = company {
            configure(with: company)
        }
    }
    
    // MARK: - Private methods
    
    private func configure(with model: Company) {
        logoImageView.image = UIImage(named: model.imageName)
        
        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }
    
}
