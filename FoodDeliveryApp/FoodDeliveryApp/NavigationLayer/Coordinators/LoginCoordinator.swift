//
//  LoginCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 17.06.2024.
//

import Foundation

// MARK: - LoginCoordinator
class LoginCoordinator: Coordinator {


    // MARK: - Properties
    private let factory = SceneFactory.self

    // MARK:- Methods
    override func start() {
        showAuthScene()
    }

    override func finish() {
        print("LoginCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }

}

// MARK: - Navigation
extension LoginCoordinator {
    func showAuthScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignInScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignUpScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
