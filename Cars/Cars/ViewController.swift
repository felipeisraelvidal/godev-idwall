//
//  ViewController.swift
//  Cars
//
//  Created by SP12442 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var cars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        fetchCars()
    }
    
    // MARK: - Private methods
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func fetchCars() {
        cars = [
            .init(
                id: 0,
                name: "Jeep Compass",
                description: "",
                imageName: ""
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
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell else {
            return UITableViewCell()
        }
        
        let car = cars[indexPath.row]
        cell.configure(with: car)
        
        return cell
    }
    
}
