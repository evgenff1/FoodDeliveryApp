//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Evgeniy Fakhretdinov on 31.05.2024.
//
 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel()
        label.text = "Hello World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        ])
        
        label.font = .Roboto.thin.size(of: 40)
        label.textColor = AppColors.accentOrange
        
        view.backgroundColor = AppColors.background
    }
    
}

