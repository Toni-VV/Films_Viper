//
//  HomeInteractorProtocol.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

protocol HomeInteractorProtocol {
    
    func obtainPopularMovies(page: Int, completion: @escaping (Result<MoviesPageResponse, Error>) -> Void)
    
}

