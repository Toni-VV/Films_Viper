//
//  TabBarProtocol.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

protocol TabCoordinatorProtocol {
    
    var childControllers: [TabScreenCoordinatorProtocol] { get }
    
    init(tabBarController: UITabBarController)
    
    func start() -> UITabBarController
    
}

protocol TabScreenCoordinatorProtocol {
    
    var navigationController: UINavigationController { get }
    
    func makeNavController() -> UINavigationController
}
