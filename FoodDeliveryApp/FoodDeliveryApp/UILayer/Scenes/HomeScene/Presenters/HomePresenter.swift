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
    var foodItems: [FoodItem] { get }
    func getSelectedCategory() -> FoodCategory
}

class HomePresenter: HomePresenterProtocol {

    // MARK: - Properties
    let coordinator: HomeCoordinator
    var categoryData = [FoodCategory]()
    var foodMenuData = [FoodMenuItem]()
    var restaurantData = [Restaurant]()
    var foodItems = [FoodItem]()

    // MARK: - Initializers
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategoryData()
        getFoodMenuData()
        getRestaurantData()
        getFoodItems()
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
    
    private func getFoodItems() {
        let decription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"
        foodItems = [
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription),
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription + decription + decription),
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription),
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription),
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription),
            FoodItem(name: "Dogmie jagong tutung", imageName: "foodItem", price: "$99.99", likes: 999, dislikes: 93, description: decription),
        ]
    }
}
