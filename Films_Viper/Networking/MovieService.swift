//
//  MovieService.swift
//  Films_Viper
//
//  Created by Антон Волков on 13.04.2022.
//

import Foundation
import Moya

protocol MovieServiceProtocol {
    
    func getPopularMovies(page: Int, completion: @escaping (Result<MoviesPageResponse, Error>) -> Void)
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MoviesPageResponse, Error>) -> Void)
    func getMovieDetailInfo(movieId: Int, completion: @escaping (Result<MovieDetailResponse, Error>) -> Void)
    
}

struct MovieService {
    
    // MARK: - Private variables
    
    private let provider = MoyaProvider<MovieTarget>()
    
}

// MARK: - MovieServiceProtocol

extension MovieService: MovieServiceProtocol {
    
    func getPopularMovies(page: Int,
                          completion: @escaping (Result<MoviesPageResponse, Error>) -> Void) {
        provider.request(.popularMovie(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try response.map(MoviesPageResponse.self)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func getTopRatedMovies(page: Int,
                           completion: @escaping (Result<MoviesPageResponse, Error>) -> Void) {
        provider.request(.topRatedMovie(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try response.map(MoviesPageResponse.self)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
        
    }
    
    func getMovieDetailInfo(movieId: Int,
                            completion: @escaping (Result<MovieDetailResponse, Error>) -> Void) {
        provider.request(.movieDetailInfo(movieId: movieId)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try response.map(MovieDetailResponse.self)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}

