//
//  HomePresenter.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import Foundation

final class HomePresenter {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private var page: Int = 1
    private var totalPages: Int = 1
    private var isPagingEnabled = true
    
    // MARK: External dependencies
    
    private unowned let view: HomeViewInput
    private var interactor: HomeInteractorProtocol
    private weak var moduleOutput: HomeModuleOutput?
    
    // MARK: - Initialization
    
    init(view: HomeViewInput,
         interactor: HomeInteractorProtocol,
         moduleOutput: HomeModuleOutput?) {
        self.view = view
        self.interactor = interactor
        self.moduleOutput = moduleOutput
    }
}

// MARK: - HomeScreenOutput

extension HomePresenter: HomeViewOutput {
    
    func didStartScrolling(scrollDirection: MovieView.ScrollDirection) {
        
        if scrollDirection == .toTop, page > 1 {
            page -= 1
        } else if scrollDirection == .toBottom, page < totalPages {
            page += 1
        } else {
            return
        }
        obtainMoviesAt(page: page, pagination: true)
    }
    
    func didFinishLoadingScreen() {
        obtainMoviesAt(page: page, pagination: true)
    }
    
    func didSelectMovie(movieId: Int) {
        moduleOutput?.didOpenMovieDetailInfoScreen(movieId: movieId)
    }

}

private extension HomePresenter {
    
    func obtainMoviesAt(page: Int, pagination: Bool) {
        guard isPagingEnabled, page <= totalPages else { return }

        isPagingEnabled = !pagination
        view.setLoaderVisible(true)
        
        interactor.obtainPopularMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            
            self.view.setLoaderVisible(false)
            switch result {
            case let .success(response):
                self.totalPages = response.totalPages
                self.page = response.page
                let moviesModel = response.results.map { movie in
                    MovieCell.Model(
                        posterPath: movie.posterPath,
                        title: movie.title,
                        overview: movie.overview,
                        releaseDate: movie.releaseDate,
                        movieId: movie.id
                    )
                }
                self.view.configureViews(with: moviesModel)
            case .failure:
                self.view.configureViews(with: [])
            }
            self.isPagingEnabled = pagination
        }
    }
    
}

