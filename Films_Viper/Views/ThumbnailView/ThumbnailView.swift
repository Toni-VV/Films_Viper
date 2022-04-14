//
//  ThumbnailView.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

class ThumbnailView: UIView {
    
    // MARK: - Public
    
    // MARK: Functions
    
    func configure(model: Model) {
        movieImage.load(from: "\(NetworkConstants.baseImagePath)\(model.imagePath)")
        playCircleImage.image = UIImage(systemName: "play.circle")
        starImage.image = UIImage(systemName: "star.fill")
        voteAvarageLabel.text = String(model.voteAvarage)
        titleLabel.text = model.title
    }
    
    //MARK: Variables
    
    var onTapPlayButton: (() -> Void)?
    
    // MARK: - Private
    
    // MARK: UI
    
    private let movieImage = makeImageView()
    private let playCircleImage = makeImageView()
    private let voteAvarageLabel = makeVoteAvarageLabel()
    private let starImage = makeStarImage()
    private let titleLabel = makeTitleLabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayCircleImage()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - TapGecture

private extension ThumbnailView {
    
    func addActionForCircleImage() {
        playCircleImage.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(circleImageTapped(tapGestureRecognizer:))
        )
        playCircleImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func circleImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        onTapPlayButton?()
    }
    
}

// MARK: - Private functions

private extension ThumbnailView {
    
    func setupPlayCircleImage() {
        playCircleImage.tintColor = .orange
        addActionForCircleImage()
    }
    
    //MARK: - SetupLayout
    
    func setupLayout() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        playCircleImage.translatesAutoresizingMaskIntoConstraints = false
        voteAvarageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        starImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: self.topAnchor),
            movieImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            movieImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            movieImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        addSubview(playCircleImage)
        NSLayoutConstraint.activate([
            playCircleImage.widthAnchor.constraint(equalToConstant: 64),
            playCircleImage.heightAnchor.constraint(equalToConstant: 64),
            playCircleImage.centerXAnchor.constraint(equalTo: movieImage.centerXAnchor),
            playCircleImage.centerYAnchor.constraint(equalTo: movieImage.centerYAnchor)
        ])
        
        addSubview(starImage)
        NSLayoutConstraint.activate([
            starImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            starImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
        
        addSubview(voteAvarageLabel)
        NSLayoutConstraint.activate([
            voteAvarageLabel.trailingAnchor.constraint(equalTo: starImage.leadingAnchor, constant: -4),
            voteAvarageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: voteAvarageLabel.leadingAnchor,
                                                 constant: -20)
        ])
    }
    
    // Functions
    
    static func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    static func makeVoteAvarageLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-SemiBold", size: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }
    
    static func makeStarImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.tintColor = .orange
        imageView.contentMode = .center
        return imageView
    }
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Bold", size: 16)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }
    
}

extension ThumbnailView {
    
    struct Model {
        let title: String
        let voteAvarage: Double
        let imagePath: String
    }
    
}

