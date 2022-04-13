//
//  HomeInteractor.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

struct HomeInteractor {
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func obtainPopularMovies(page: Int,
                             completion: @escaping (Result<MoviesPageResponse, Error>) -> Void) {
        movieService.getPopularMovies(page: page) { result in
            switch result {
            case let .success(responce):
                completion(.success(responce))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
