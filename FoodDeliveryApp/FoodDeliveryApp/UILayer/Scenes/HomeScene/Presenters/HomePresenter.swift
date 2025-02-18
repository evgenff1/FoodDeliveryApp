//
//  HomeViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 17.02.2025.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var categoryData: [FoodCategory] { get }
    var foodMenuData: [FoodMenuItem] { get }
//    var restaurantData: [Restaurant] { get }
    func getSelectedCategory() -> FoodCategory
}

class HomePresenter: HomePresenterProtocol {

    // MARK: - Properties
    let coordinator: HomeCoordinator
    var categoryData = [FoodCategory]()
    var foodMenuData = [FoodMenuItem]()

    // MARK: - Initializers
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategoryData()
        getFoodMenuData()
    }

    // MARK: - Methods
    func getSelectedCategory() -> FoodCategory {
        return .none
    }

    private func getCategoryData() {
        // Mock data
        categoryData = [.drink, .food, .cake, .snack, .salad, .seafood]
    }
    
    private func getFoodMenuData() {
        // Mock data
        foodMenuData = [.burgers, .fruit, .pizza, .sushi, .bbq, .noodle]
    }
}
