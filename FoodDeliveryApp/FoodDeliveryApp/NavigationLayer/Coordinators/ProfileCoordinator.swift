//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 08.06.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .black
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}
