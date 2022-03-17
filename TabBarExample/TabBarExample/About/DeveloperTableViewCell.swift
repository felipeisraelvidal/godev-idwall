//
//  DeveloperTableViewCell.swift
//  TabBarExample
//
//  Created by SP12442 on 17/03/22.
//

import UIKit

class DeveloperTableViewCell: UITableViewCell {

    static let identifier = "DeveloperTableViewCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var handleGitHubTapped: (() -> Void)?
    var handleLinkedInTapped: (() -> Void)?
    
    // MARK: - Public methods
    
    func configure(with developer: Developer) {
        nameLabel.text = developer.name
    }
    
    // MARK: - Actions
    
    @IBAction private func handleGitHub(_ sender: UIButton) {
        handleGitHubTapped?()
    }
    
    @IBAction private func handleLinkedIn(_ sender: UIButton) {
        handleLinkedInTapped?()
    }
    
}
