//
//  TabBarCoordinator.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import Foundation
import UIKit


protocol TabCoordinatorProtocol: CoordinatorProtocol {
    
    var childCoordinators: [CoordinatorProtocol] { get set }
    
}

final class TabBarCoordinator: TabCoordinatorProtocol {
    
    var childCoordinators: [CoordinatorProtocol] = [HomeCoordinator()]
    
    var parentCoordinator: CoordinatorProtocol?
    
    var rootViewController: UIViewController
    
    init(tabBarController: UITabBarController) {
        self.rootViewController = tabBarController
    }
    
    func start() -> UIViewController {
        guard let tabBarController = rootViewController as? UITabBarController else {
            fatalError("Error with created TabBarController")
        }
        tabBarController.viewControllers = childCoordinators.map {
            $0.parentCoordinator = self
            return $0.start()
        }
        
        tabBarController.tabBar.unselectedItemTintColor = .white
        tabBarController.tabBar.backgroundColor = .tabBarBackground
        tabBarController.tabBar.tintColor = .orange
        return tabBarController
    }
    
    
}

