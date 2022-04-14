//
//  MovieView.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

final class MovieView: UIView {
    
    // MARK: - Public
    
    // MARK: UI
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset.top = 24
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Variables
    
    var movies: [MovieCell.Model] = []
    var onSelectItem: ((Int) -> Void)?
    var didScrollAllMovies: ((ScrollDirection) -> Void)?
    
    // MARK: - Private
    
    private let heightProvider: HeightProvider
    
    // MARK: - Init
    
    init() {
        heightProvider = HeightProvider(collectionView: collectionView)
        
        super.init(frame: .zero)
        
        setupCollectionView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension MovieView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstants.movieIdentifier,
                                                      for: indexPath) as! MovieCell
        cell.configure(model: movies[indexPath.section])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MovieView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectItem?(movies[indexPath.section].movieId)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MovieView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let movie = movies[indexPath.section]
        let titleHeight = heightProvider.getHeightForLabel(type: .title, text: movie.title)
        let overviewHeight = heightProvider.getHeightForLabel(type: .overview, text: movie.overview)
        let releaseDateHeight = heightProvider.getHeightForLabel(type: .releaseDate, text: movie.releaseDate)
        
        let textHeight = titleHeight + overviewHeight + releaseDateHeight + (CellConstants.spacing * 2)
        ImageDataProvider.shared.height = collectionView.bounds.height / CellConstants.totalHeightMultiplie
        
        let height = textHeight > ImageDataProvider.shared.height ? textHeight : ImageDataProvider.shared.height
        
        return CGSize(width: collectionView.bounds.width, height: height)
    }

}

extension MovieView: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let position = scrollView.contentOffset.y
        let spaceSwap = collectionView.bounds.height * 0.14

        if position > (collectionView.contentSize.height - spaceSwap - scrollView.frame.size.height) {
            didScrollAllMovies?(.toBottom)
        } else if position < -spaceSwap {
            didScrollAllMovies?(.toTop)
        }
    }

}


// MARK: - Private functions

private extension MovieView {
    
    func setupCollectionView() {
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: CellConstants.movieIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .background
    }
    
    // MARK: Layout
    
    func setupLayout() {
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Insets.bigInset),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Insets.bigInset)
        ])
    }
    
}

extension MovieView {
    
    enum ScrollDirection {
        case toTop
        case toBottom
    }
    
}
