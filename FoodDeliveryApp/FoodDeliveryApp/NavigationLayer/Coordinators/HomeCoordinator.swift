//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 08.06.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showHomeScene()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}

// MARK: - Navigation
extension HomeCoordinator {
    func showHomeScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeHomeScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showListScreen(for category: String, with restaurants: [Restaurant]) {
        let presenter = HomePresenter(coordinator: self)
        let listVC = RestaurantsListViewController(
            title: category,
            restaurants: restaurants,
            presenter: presenter,
            coordinator: self
        )
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    func showFoodMenuScreen(for restaurant: Restaurant, foodItems: [FoodItem]) {
        let foodMenuVC = FoodMenuViewController(restaurant: restaurant, foodItems: foodItems)
        navigationController?.pushViewController(foodMenuVC, animated: true)
    }
}
