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
            logoImageView.image = UIImage(named: company.imageName)
            
            nameLabel.text = company.name
            descriptionLabel.text = company.description
        }
    }
    
}
