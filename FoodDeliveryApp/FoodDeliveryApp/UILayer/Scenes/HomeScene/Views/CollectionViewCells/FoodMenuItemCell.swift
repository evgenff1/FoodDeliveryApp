//
//  FoodMenuItemCell.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 21.02.2025.
//

import UIKit

class FoodMenuItemCell: UICollectionViewCell {
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.bold.size(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.priceGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 12)
        label.textColor = AppColors.bottomViewGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dislikesLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 12)
        label.textColor = AppColors.bottomViewGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let smallLikeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .like))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let smallDislikeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .dislike))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let bigLikeButton: UIButton = {
        let button = UIButton()
        let likeImage = UIImage(resource: .like).withRenderingMode(.alwaysTemplate)
        button.setImage(likeImage, for: .normal)
        button.tintColor = AppColors.bottomViewGrey
        button.backgroundColor = AppColors.grey
        button.layer.cornerRadius = 9
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bigDislikeButton: UIButton = {
        let button = UIButton()
        let dislikeImage = UIImage(resource: .dislike).withRenderingMode(.alwaysTemplate)
        button.setImage(dislikeImage, for: .normal)
        button.tintColor = AppColors.bottomViewGrey
        button.backgroundColor = AppColors.grey
        button.layer.cornerRadius = 9
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: FoodItem) {
        foodImageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)"
        likesLabel.text = "\(item.likes)+ |"
        dislikesLabel.text = "\(item.dislikes)+"
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .white
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(smallLikeButton)
        contentView.addSubview(likesLabel)
        contentView.addSubview(smallDislikeButton)
        contentView.addSubview(dislikesLabel)
        contentView.addSubview(bigLikeButton)
        contentView.addSubview(bigDislikeButton)
        
        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foodImageView.widthAnchor.constraint(equalToConstant: 80),
            foodImageView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),

            smallLikeButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            smallLikeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13),
            smallLikeButton.widthAnchor.constraint(equalToConstant: 12),
            smallLikeButton.heightAnchor.constraint(equalToConstant: 12),

            likesLabel.leadingAnchor.constraint(equalTo: smallLikeButton.trailingAnchor, constant: 8),
            likesLabel.centerYAnchor.constraint(equalTo: smallLikeButton.centerYAnchor),

            smallDislikeButton.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 4),
            smallDislikeButton.centerYAnchor.constraint(equalTo: smallLikeButton.centerYAnchor),
            smallDislikeButton.widthAnchor.constraint(equalToConstant: 12),
            smallDislikeButton.heightAnchor.constraint(equalToConstant: 12),

            dislikesLabel.leadingAnchor.constraint(equalTo: smallDislikeButton.trailingAnchor, constant: 8),
            dislikesLabel.centerYAnchor.constraint(equalTo: smallLikeButton.centerYAnchor),

            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: smallLikeButton.bottomAnchor, constant: 11),

            bigLikeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            bigLikeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bigLikeButton.widthAnchor.constraint(equalToConstant: 18),
            bigLikeButton.heightAnchor.constraint(equalToConstant: 18),

            bigDislikeButton.trailingAnchor.constraint(equalTo: bigLikeButton.leadingAnchor, constant: -10),
            bigDislikeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bigDislikeButton.widthAnchor.constraint(equalToConstant: 18),
            bigDislikeButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func setupActions() {
        bigLikeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        bigDislikeButton.addTarget(self, action: #selector(didTapDislike), for: .touchUpInside)
    }
    
    @objc private func didTapLike() {
        toggleButtonState(button: bigLikeButton, isSelected: bigLikeButton.backgroundColor != AppColors.accentOrange)
        toggleButtonState(button: bigDislikeButton, isSelected: false)
    }

    @objc private func didTapDislike() {
        toggleButtonState(button: bigDislikeButton, isSelected: bigDislikeButton.backgroundColor != AppColors.accentOrange)
        toggleButtonState(button: bigLikeButton, isSelected: false)
    }

    private func toggleButtonState(button: UIButton, isSelected: Bool) {
        button.backgroundColor = isSelected ? AppColors.accentOrange : AppColors.grey
        button.tintColor = isSelected ? .white : AppColors.bottomViewGrey
    }
}



