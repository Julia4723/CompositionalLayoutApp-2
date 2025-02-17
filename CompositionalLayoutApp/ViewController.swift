//
//  ViewController.swift
//  CompositionalLayoutApp
//
//  Created by brubru on 29.11.2024.
//

import UIKit

class ViewController: UIViewController {
	private let reuseIdentifier = "reuseIdentifier"
	private var collectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		configureCollectionView()
	}
}

private extension ViewController {
    
	func setupView() {
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		collectionView.backgroundColor = .white
		collectionView.dataSource = self
		
		view.addSubview(collectionView)
	}
}

// MARK: - Settings Layout
private extension ViewController {
    func createLayout() -> UICollectionViewLayout {
        let largeItem = createLayoutItem(relativeWidth: 0.7, relativeHeight: 1)
        let smallItem = createLayoutItem(relativeWidth: 1, relativeHeight: 0.5)
        
        let rightGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(1)
        )
        
        let rightGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: rightGroupSize,
            subitems: [smallItem, smallItem]
        )
        
        let mainGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let mainGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: mainGroupSize,
            subitems: [largeItem, rightGroup]
        )
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func createLayoutItem(relativeWidth: Double, relativeHeight: Double) -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(relativeWidth),
            heightDimension: .fractionalHeight(relativeHeight)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 5
        )
        return item
    }
    
	func configureCollectionView() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
		cell.backgroundColor = .systemCyan
		cell.layer.borderColor = UIColor.black.cgColor
		cell.layer.borderWidth = 3
		return cell
	}
}
