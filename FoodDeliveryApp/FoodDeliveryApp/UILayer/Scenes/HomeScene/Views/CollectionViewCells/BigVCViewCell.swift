//
//  BigVCViewCell.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 19.06.2024.
//

import UIKit

class BigVCViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    private let restaurantImageView = UIImageView()
    private let nameLabel = UILabel()
    private let addressIcon = UIImageView(image: UIImage(resource: .geoMark))
    private let addressLabel = UILabel()
    private let timeIcon = UIImageView(image: UIImage(resource: .clock))
    private let timeLabel = UILabel()
    private let starStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        
        setupImageView()
        setupInfoStack()
        setupStars()
    }
    
    private func setupImageView() {
        contentView.addSubview(restaurantImageView)
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageView.contentMode = .scaleAspectFill
        restaurantImageView.clipsToBounds = true
        restaurantImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            restaurantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            restaurantImageView.widthAnchor.constraint(equalToConstant: 130),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupInfoStack() {
        nameLabel.font = .Roboto.bold.size(of: 14)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 1
        
        addressLabel.font = .Roboto.regular.size(of: 12)
        addressLabel.textColor = .gray
        addressLabel.numberOfLines = 1
        
        timeLabel.font = .Roboto.regular.size(of: 12)
        timeLabel.textColor = .gray
        timeLabel.numberOfLines = 1
        
        addressIcon.contentMode = .scaleAspectFit
        addressIcon.translatesAutoresizingMaskIntoConstraints = false

        timeIcon.contentMode = .scaleAspectFit
        timeIcon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            addressIcon.widthAnchor.constraint(equalToConstant: 12),
            addressIcon.heightAnchor.constraint(equalToConstant: 12),
            timeIcon.widthAnchor.constraint(equalToConstant: 12),
            timeIcon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        let addressStack = UIStackView(arrangedSubviews: [addressIcon, addressLabel])
        addressStack.axis = .horizontal
        addressStack.spacing = 8
        addressStack.alignment = .center
        
        let timeStack = UIStackView(arrangedSubviews: [timeIcon, timeLabel])
        timeStack.axis = .horizontal
        timeStack.spacing = 8
        timeStack.alignment = .center
        
        let infoStackView = UIStackView(arrangedSubviews: [nameLabel, addressStack, timeStack])
        infoStackView.axis = .vertical
        infoStackView.alignment = .leading
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(infoStackView)

        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        infoStackView.setCustomSpacing(15, after: nameLabel)
        infoStackView.setCustomSpacing(10, after: addressStack)
    }
    
    private func setupStars() {
        starStackView.axis = .horizontal
        starStackView.spacing = 2.5
        starStackView.translatesAutoresizingMaskIntoConstraints = false

        for _ in 0..<5 {
            let starImageView = UIImageView(image: UIImage(resource: .star))
            starImageView.tintColor = AppColors.starsYellow
            starImageView.contentMode = .scaleAspectFit
            starImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
            starImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
            starStackView.addArrangedSubview(starImageView)
        }
        
        contentView.addSubview(starStackView)

        NSLayoutConstraint.activate([
            starStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            starStackView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20),
            starStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Configuration
    func configure(with restaurant: Restaurant) {
        restaurantImageView.image = UIImage(named: restaurant.imageName)
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        timeLabel.text = "\(restaurant.time) - \(restaurant.distance)"
    }
}



