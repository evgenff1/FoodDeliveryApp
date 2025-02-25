//
//  FoodDetailViewController.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 23.02.2025.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let foodItem: FoodItem
    
    // MARK: - Views
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let smallLikeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .likeBig))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 12)
        label.textColor = AppColors.bottomViewGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let smallDislikeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .dislikeBig))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dislikesLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 12)
        label.textColor = AppColors.bottomViewGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bigLikeButton: UIButton = {
        let button = UIButton()
        let likeImage = UIImage(resource: .likeBig).withRenderingMode(.alwaysTemplate)
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
        let dislikeImage = UIImage(resource: .dislikeBig).withRenderingMode(.alwaysTemplate)
        button.setImage(dislikeImage, for: .normal)
        button.tintColor = AppColors.bottomViewGrey
        button.backgroundColor = AppColors.grey
        button.layer.cornerRadius = 9
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.priceGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .Roboto.regular.size(of: 12)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addToOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to order", for: .normal)
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.backgroundColor = AppColors.accentOrange
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializer
    init(foodItem: FoodItem) {
        self.foodItem = foodItem
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
        configure()
        setupActions()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

// MARK: - UI Setup
private extension FoodDetailViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(smallLikeButton)
        contentView.addSubview(likesLabel)
        contentView.addSubview(smallDislikeButton)
        contentView.addSubview(dislikesLabel)
        contentView.addSubview(bigLikeButton)
        contentView.addSubview(bigDislikeButton)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        view.addSubview(addToOrderButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: addToOrderButton.topAnchor, constant: -20),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 46),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -46),
            foodImageView.heightAnchor.constraint(equalToConstant: 322),
            
            smallLikeButton.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 19),
            smallLikeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            smallLikeButton.widthAnchor.constraint(equalToConstant: 14.93),
            smallLikeButton.heightAnchor.constraint(equalToConstant: 14.55),
            
            likesLabel.centerYAnchor.constraint(equalTo: smallLikeButton.centerYAnchor),
            likesLabel.leadingAnchor.constraint(equalTo: smallLikeButton.trailingAnchor, constant: 9.95),
            
            smallDislikeButton.centerYAnchor.constraint(equalTo: smallLikeButton.centerYAnchor),
            smallDislikeButton.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 12.67),
            smallDislikeButton.widthAnchor.constraint(equalToConstant: 14.93),
            smallDislikeButton.heightAnchor.constraint(equalToConstant: 14.55),
            
            dislikesLabel.centerYAnchor.constraint(equalTo: smallDislikeButton.centerYAnchor),
            dislikesLabel.leadingAnchor.constraint(equalTo: smallDislikeButton.trailingAnchor, constant: 9.95),
            
            bigLikeButton.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 19),
            bigLikeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            bigLikeButton.widthAnchor.constraint(equalToConstant: 22.39),
            bigLikeButton.heightAnchor.constraint(equalToConstant: 21.83),
            
            bigDislikeButton.centerYAnchor.constraint(equalTo: bigLikeButton.centerYAnchor),
            bigDislikeButton.trailingAnchor.constraint(equalTo: bigLikeButton.leadingAnchor, constant: -12.44),
            bigDislikeButton.widthAnchor.constraint(equalToConstant: 22.39),
            bigDislikeButton.heightAnchor.constraint(equalToConstant: 21.83),
            
            priceLabel.topAnchor.constraint(equalTo: smallLikeButton.bottomAnchor, constant: 13.81),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 23),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 48),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            addToOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            addToOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            addToOrderButton.heightAnchor.constraint(equalToConstant: 50),
            addToOrderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    // MARK: - Navigation Bar
    func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = foodItem.name
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
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configuration
    func configure() {
        foodImageView.image = UIImage(named: foodItem.imageName)
        priceLabel.text = "\(foodItem.price)"
        likesLabel.text = "\(foodItem.likes)+ |"
        dislikesLabel.text = "\(foodItem.dislikes)+"
        descriptionLabel.text = foodItem.description
    }
    
    // MARK: - Button Actions
    func setupActions() {
        bigLikeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        bigDislikeButton.addTarget(self, action: #selector(didTapDislike), for: .touchUpInside)
    }
    
    @objc func didTapLike() {
        toggleButtonState(button: bigLikeButton, isSelected: bigLikeButton.backgroundColor != AppColors.accentOrange)
        toggleButtonState(button: bigDislikeButton, isSelected: false)
    }
    
    @objc func didTapDislike() {
        toggleButtonState(button: bigDislikeButton, isSelected: bigDislikeButton.backgroundColor != AppColors.accentOrange)
        toggleButtonState(button: bigLikeButton, isSelected: false)
    }
    
    func toggleButtonState(button: UIButton, isSelected: Bool) {
        button.backgroundColor = isSelected ? AppColors.accentOrange : AppColors.grey
        button.tintColor = isSelected ? .white : AppColors.bottomViewGrey
    }
}





