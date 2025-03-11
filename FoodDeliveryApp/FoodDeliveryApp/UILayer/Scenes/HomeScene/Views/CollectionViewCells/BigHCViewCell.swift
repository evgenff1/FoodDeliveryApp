//
//  BigHCViewCell.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 19.06.2024.
//

import UIKit

class BigHCViewCell: UICollectionViewCell {

    // MARK: - UI Elements
    private let topView = UIView()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    func configure(with category: FoodMenuItem) {
        titleLabel.text = category.rawValue
        switch category {
        case .burgers:
            imageView.image = UIImage(resource: .burgers)
        case .pizza:
            imageView.image = UIImage(resource: .pizza)
        case .bbq:
            imageView.image = UIImage(resource: .bbq)
        case .fruit:
            imageView.image = UIImage(resource: .fruit)
        case .sushi:
            imageView.image = UIImage(resource: .sushi)
        case .noodle:
            imageView.image = UIImage(resource: .noodle)
        case .none:
            imageView.image = UIImage(resource: .noPictures)
        }
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
        topView.backgroundColor = .clear
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
        ])
    }

    private func setupBottomLabel() {
        contentView.addSubview(titleLabel)

        titleLabel.font = .Roboto.bold.size(of: 14)
        titleLabel.textColor = .white

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15)
        ])
    }
}
