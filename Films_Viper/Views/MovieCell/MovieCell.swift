//
//  MovieCell.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    // MARK: - Private
    
    // MARK: UI
    
    private let posterImageView = makeImageView()
    private let titleLabel = makeTitleLabel()
    private let overviewLabel = makeOverviewLabel()
    private let releaseDateLabel = makeReleaseLabel()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public dunctions
    
    func configure(model: MovieCell.Model) {
        posterImageView.load(from: "\(NetworkConstants.baseImagePath)\(model.posterPath)")
        titleLabel.text = model.title
        overviewLabel.text = model.overview
        releaseDateLabel.text = model.releaseDate
    }
    
}

// MARK: - Private functions

private extension MovieCell {
    
    // MARK: Setup
    
    func setupView() {
        backgroundColor = .background
    }
    
    func setupLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let textLabelsStackView = UIStackView(
            arrangedSubviews: [titleLabel, overviewLabel, releaseDateLabel]
        )
        textLabelsStackView.axis = .vertical
        textLabelsStackView.spacing = CellConstants.spacing
        textLabelsStackView.alignment = .top
        textLabelsStackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(textLabelsStackView)
        NSLayoutConstraint.activate([
            textLabelsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            textLabelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textLabelsStackView.widthAnchor.constraint(equalTo: self.widthAnchor,
                                                       multiplier: CellConstants.textLabelsMultiplier)
        ])

        addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: self.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: textLabelsStackView.leadingAnchor,
                                                      constant: -CellConstants.spacing),
            posterImageView.heightAnchor.constraint(equalToConstant: .zero)
        ])
    }
}

// MARK: - View builders

extension MovieCell {
    
    static func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    // MARK: Labels
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }
    
    static func makeOverviewLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Regular", size: 12)
        label.textColor = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }
    
    static func makeReleaseLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-SemiBold", size: 12)
        label.textColor = UIColor(red: 1, green: 0.612, blue: 0.029, alpha: 1)
        label.textAlignment = .left
        return label
    }
    
}
