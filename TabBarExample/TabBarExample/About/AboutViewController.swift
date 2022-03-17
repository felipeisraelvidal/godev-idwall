//
//  AboutViewController.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var developers: [Developer] = [
        .init(
            name: "Felipe Israel de Oliveira Vidal",
            githubURL: "https://github.com/felipeisraelvidal",
            linkedInURL: "http://linkedin.com/in/felipeisrael"
        ),
        .init(
            name: "Lucas de Castro Souza",
            githubURL: "",
            linkedInURL: ""
        ),
        .init(
            name: "Paulo Campanha",
            githubURL: "",
            linkedInURL: ""
        ),
        .init(
            name: "Antonio Carlos",
            githubURL: "",
            linkedInURL: ""
        ),
        .init(
            name: "Larissa Monteiro",
            githubURL: "",
            linkedInURL: ""
        ),
        .init(
            name: "Myllene Ferreira da Silva",
            githubURL: "",
            linkedInURL: ""
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let aboutCell = UINib(nibName: AboutTableViewCell.identifier, bundle: nil)
        tableView.register(aboutCell, forCellReuseIdentifier: AboutTableViewCell.identifier)
        
        let developerCell = UINib(nibName: DeveloperTableViewCell.identifier, bundle: nil)
        tableView.register(developerCell, forCellReuseIdentifier: DeveloperTableViewCell.identifier)
    }
    
    private func openURL(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }

}

extension AboutViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Desenvolvedores"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return developers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as? AboutTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DeveloperTableViewCell.identifier, for: indexPath) as? DeveloperTableViewCell else {
                return UITableViewCell()
            }
            
            let developer = developers[indexPath.row]
            cell.configure(with: developer)
            
            cell.handleGitHubTapped = { [weak self] in
                self?.openURL(developer.githubURL)
            }
            
            cell.handleLinkedInTapped = { [weak self] in
                self?.openURL(developer.linkedInURL)
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
