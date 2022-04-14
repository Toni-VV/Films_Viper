//
//  HomeViewProtocol.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

protocol HomeViewInput: AnyObject {
    
    func configureViews(with movies: [MovieCell.Model])
    func setLoaderVisible(_ isVisible: Bool)
    
}

protocol HomeViewOutput {
    
    func didStartScrolling(scrollDirection: MovieView.ScrollDirection)
    func didFinishLoadingScreen()
    func didSelectMovie(movieId: Int)
    
}
