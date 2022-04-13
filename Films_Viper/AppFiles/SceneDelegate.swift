//
//  SceneDelegate.swift
//  Films_Viper
//
//  Created by Антон Волков on 13.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let tabBar = TabBarCoordinator(tabBarController: UITabBarController())
        window?.rootViewController = tabBar.start()
        window?.makeKeyAndVisible()
    }

}

