//
//  HomeAssembly.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import Foundation

final class HomeModuleAssembly {
    
    static func buildModule(moduleOutput: HomeModuleOutput?) -> HomeView {
        let view = HomeView()
        let service = MovieService()
        let interactor = HomeInteractor(movieService: service)
        
        let presenter = HomePresenter(
            view: view,
            interactor: interactor,
            moduleOutput: moduleOutput
        )
        view.output = presenter
        return view
    }
    
}
