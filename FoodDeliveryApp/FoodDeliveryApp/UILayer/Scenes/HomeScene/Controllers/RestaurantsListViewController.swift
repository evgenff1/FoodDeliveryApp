//
//  RestaurantsListViewController.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 21.02.2025.
//

import UIKit

class RestaurantsListViewController: UIViewController {
    
    // MARK: - Properties
    private let titleText: String
    private let restaurants: [Restaurant]
    
    // MARK: - Views
    private let searchField = FDSearchField()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()

    // MARK: - Initializer
    init(title: String, restaurants: [Restaurant]) {
        self.titleText = title
        self.restaurants = restaurants
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
}

// MARK: - UI Setup
private extension RestaurantsListViewController {
    func setupUI() {
        view.backgroundColor = .white
        title = titleText
        
        view.addSubview(searchField)
        view.addSubview(collectionView)
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchField.heightAnchor.constraint(equalToConstant: 50),

            collectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 28),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BigVCViewCell.self, forCellWithReuseIdentifier: "BigVCViewCell")
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = UIFont.Roboto.bold.size(of: 18)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center

        navigationItem.titleView = titleLabel
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension RestaurantsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCViewCell", for: indexPath) as? BigVCViewCell
        cell?.configure(with: restaurants[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RestaurantsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 130)
    }
}

