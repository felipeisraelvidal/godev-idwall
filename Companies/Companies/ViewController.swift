//
//  ViewController.swift
//  Companies
//
//  Created by SP12442 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var companies: [Company] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        fetchCars()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCompanyDetails" {
            if let destination = segue.destination as? CompanyDetailsViewController, let company = sender as? Company {
                destination.company = company
            }
        }
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: CompanyTableViewCell.identifier, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: CompanyTableViewCell.identifier)
        
    }
    
    private func fetchCars() {
        companies = [
            .init(
                id: 0,
                name: "Apple",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageName: "apple"
            ),
            .init(
                id: 1,
                name: "Amazon",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageName: "amazon"
            ),
            .init(
                id: 2,
                name: "Facebook",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageName: "facebook"
            ),
            .init(
                id: 3,
                name: "Google",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageName: "google"
            )
        ]
        
        tableView.reloadData()
    }
    
    // MARK: - Public methods
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.identifier, for: indexPath) as? CompanyTableViewCell else {
            return UITableViewCell()
        }

        let car = companies[indexPath.row]
        cell.configure(with: car)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = companies[indexPath.row]
        performSegue(withIdentifier: "showCompanyDetails", sender: company)
    }
    
}
