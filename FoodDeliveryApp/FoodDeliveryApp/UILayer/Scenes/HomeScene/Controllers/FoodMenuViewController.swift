//
//  FoodMenuViewController.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 21.02.2025.
//

import UIKit

class FoodMenuViewController: UIViewController {
    
    // MARK: - Properties
    private let restaurant: Restaurant
    private let foodItems: [FoodItem]
    
    // MARK: - Views
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Initializer
    init(restaurant: Restaurant, foodItems: [FoodItem]) {
        self.restaurant = restaurant
        self.foodItems = foodItems
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
private extension FoodMenuViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FoodMenuItemCell.self, forCellWithReuseIdentifier: "FoodMenuItemCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = restaurant.name
        titleLabel.font = UIFont.Roboto.bold.size(of: 14)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center

        navigationItem.titleView = titleLabel
    
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(resource: .back), for: .normal)
        backButton.tintColor = .black
        backButton.frame = CGRect(x: 0, y: 0, width: 5, height: 10)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension FoodMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodMenuItemCell", for: indexPath) as? FoodMenuItemCell
        cell?.configure(with: foodItems[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FoodMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 80)
    }
}

