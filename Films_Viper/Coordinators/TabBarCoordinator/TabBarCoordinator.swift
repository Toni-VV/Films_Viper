//
//  TabBarCoordinator.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

final class TabBarCoordinator: TabCoordinatorProtocol {
    
    var childControllers: [TabScreenCoordinatorProtocol] = []
    
    unowned let tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() -> UITabBarController {
        tabBarController.viewControllers = childControllers.map {
            $0.makeNavController()
        }
        tabBarController.tabBar.backgroundColor = .tabBarBackground
        
        return tabBarController
    }
    
    
}

