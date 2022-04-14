//
//  HomeView.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

final class HomeView: UIViewController {
    
    // MARK: - Public
    
    var output: HomeViewOutput!
    
    // MARK: UI
    
    let loadingIndicator = LoadingIndicator(frame: .zero)
    
    // MARK: - Private
    
    private let moviesView = MovieView()
    
    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        setupView()
        setupNavBar()
        setupMoviesView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didFinishLoadingScreen()
    }

    
}

extension HomeView: HomeViewInput {
    
    func configureViews(with movies: [MovieCell.Model]) {
        guard !movies.isEmpty else { return }
        movies.forEach {
            print($0.movieId)
            print($0.title)
        }
    }
    
    func setLoaderVisible(_ isVisible: Bool) {
        setLoading(isVisible)
    }
    
    
}

extension HomeView: LoadingDisplayable { }

// MARK: - Private functions

private extension HomeView {
    
    // MARK: - Setup
    
    func setupView() {
        view.backgroundColor = .background
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
        guard let titleImage = UIImage(named: NavBarConstants.imageName) else { return }
        
        setNavigationBarTitle(NavBarConstants.title, andImage: titleImage)
    }
    
    func setupMoviesView() {
        moviesView.onSelectItem = { [weak self] movieId in
            self?.output.didSelectMovie(movieId: movieId)
        }
        moviesView.didScrollAllMovies = { [weak self] scrollDirection in
            self?.output.didStartScrolling(scrollDirection: scrollDirection)
        }
    }
    
    // MARK: Layout
    
    func setupLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(moviesView)
        moviesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moviesView.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                            constant: Insets.mediumInset),
            moviesView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            moviesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                                  constant: Insets.topInsetForLoader),
        ])
    }
    
}
