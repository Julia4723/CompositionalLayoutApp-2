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
		return UICollectionViewLayout()
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
