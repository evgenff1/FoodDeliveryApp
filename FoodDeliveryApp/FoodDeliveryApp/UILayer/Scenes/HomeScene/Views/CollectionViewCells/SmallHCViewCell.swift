//
//  SmallHCViewCell.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 18.06.2024.
//

import UIKit

class SmallHCViewCell: UICollectionViewCell {

    // MARK: - UI Elements
    private let topView = UIView()
    private let bottomLabel = UILabel()
    private let imageView = UIImageView()
    private var isCategorySelected = false

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure(with category: FoodCategory) {
        bottomLabel.text = category.rawValue
        switch category {
        case .drink:
            imageView.image = UIImage(resource: .drinks).withTintColor(isCategorySelected ? .white : .black)
        case .snack:
            imageView.image = UIImage(resource: .snack).withTintColor(isCategorySelected ? .white : .black)
        case .food:
            imageView.image = UIImage(resource: .food).withTintColor(isCategorySelected ? .white : .black)
        case .cake:
            imageView.image = UIImage(resource: .cake).withTintColor(isCategorySelected ? .white : .black)
        case .salad:
            imageView.image = UIImage(resource: .salad).withTintColor(isCategorySelected ? .white : .black)
        case .seafood:
            imageView.image = UIImage(resource: .seafood).withTintColor(isCategorySelected ? .white : .black)
        case .none:
            imageView.image = UIImage(resource: .noPictures).withTintColor(isCategorySelected ? .white : .black)
        }
    }
    
    func toggleSelection() {
        if isCategorySelected {
            imageView.image = imageView.image?.withTintColor(.black)
            topView.backgroundColor = AppColors.grey
        } else {
            imageView.image = imageView.image?.withTintColor(.white)
            topView.backgroundColor = AppColors.accentOrange
        }
        isCategorySelected.toggle()
    }

    // MARK: - Setup
    private func setupCell() {
        contentView.backgroundColor = .clear
        
        setupTopView()
        setupBottomLabel()
    }

    private func setupTopView() {
        contentView.addSubview(topView)

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = AppColors.grey
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setupBottomLabel() {
        contentView.addSubview(bottomLabel)

        bottomLabel.font = .Roboto.regular.size(of: 14)
        bottomLabel.text = "test label"
        bottomLabel.textColor = AppColors.black

        bottomLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
