//
//  HomeCoordinator.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: CoordinatorProtocol?
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let homeVC = HomeModuleAssembly.buildModule(moduleOutput: self)
        
        let tabBarItem = UITabBarItem(title: "Home",
                                      image: UIImage(systemName: TabBarConstants.homeImageName),
                                      tag: 0)
        homeVC.tabBarItem = tabBarItem
        
        return homeVC
    }
    
}

extension HomeCoordinator: HomeModuleOutput {
    func didOpenMovieDetailInfoScreen(movieId: Int) {
         
    }
}
