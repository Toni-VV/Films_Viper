//
//  HomeModuleOutput.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import Foundation

protocol HomeModuleOutput: AnyObject {
    
    func didOpenMovieDetailInfoScreen(movieId: Int)
    
}
