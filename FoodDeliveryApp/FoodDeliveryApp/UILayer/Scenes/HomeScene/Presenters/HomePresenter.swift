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
    var restaurantData: [Restaurant] { get }
    var coordinator: HomeCoordinator { get }
    func getSelectedCategory() -> FoodCategory
}

class HomePresenter: HomePresenterProtocol {

    // MARK: - Properties
    let coordinator: HomeCoordinator
    var categoryData = [FoodCategory]()
    var foodMenuData = [FoodMenuItem]()
    var restaurantData = [Restaurant]()

    // MARK: - Initializers
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategoryData()
        getFoodMenuData()
        getRestaurantData()
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
    
    private func getRestaurantData() {
        restaurantData = [
            Restaurant(name: "Dapur Ijah Restaurant", address: "13th Street, 46 W 12th St, NY", distance: "1.1 km", time: "3 min", imageName: "restaurant"),
            Restaurant(name: "Dapur Ijah Restaurant", address: "13th Street, 46 W 12th St, NY", distance: "1.1 km", time: "3 min", imageName: "restaurant"),
            Restaurant(name: "Dapur Ijah Restaurant", address: "13th Street, 46 W 12th St, NY", distance: "1.1 km", time: "3 min", imageName: "restaurant"),
            Restaurant(name: "Dapur Ijah Restaurant", address: "13th Street, 46 W 12th St, NY", distance: "1.1 km", time: "3 min", imageName: "restaurant"),
            Restaurant(name: "Dapur Ijah Restaurant", address: "13th Street, 46 W 12th St, NY", distance: "1.1 km", time: "3 min", imageName: "restaurant"),
        ]
    }
}
