//
//  CategoriesViewController.swift
//  TabBarExample
//
//  Created by SP12442 on 16/03/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var categories = Category.allCases

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovies" {
            if let destinationViewController = segue.destination as? CategoryMoviesViewController, let category = sender as? Category {
                destinationViewController.category = category
            }
        }
    }
    
    // MARK: - Private methods
    
    private func configureCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let categoryCell = UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
        collectionView.register(categoryCell, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            layout.minimumInteritemSpacing = 16
            layout.minimumLineSpacing = 16
        }
        
    }

}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 32 - 16
        let cardWidth = width / 2
        return CGSize(width: cardWidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let category = categories[indexPath.item]
        cell.configure(with: category)
        
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        performSegue(withIdentifier: "showMovies", sender: category)
    }
    
}
