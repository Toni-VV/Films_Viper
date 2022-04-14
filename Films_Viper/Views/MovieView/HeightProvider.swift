//
//  HeightProvider.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

enum LabelPurpose {
    case title
    case overview
    case releaseDate
}

struct HeightProvider {
    
    private unowned let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func getHeightForLabel(type: LabelPurpose, text: String) -> CGFloat {
        let label: UILabel
        
        switch type {
        case .title:
            label = MovieCell.makeTitleLabel()
        case .overview:
            label = MovieCell.makeOverviewLabel()
        case .releaseDate:
            label = MovieCell.makeReleaseLabel()
        }
        
        label.text = text
        let widthOfLabel = collectionView.bounds.width * CellConstants.textLabelsMultiplier
        let maxSize = CGSize(width: widthOfLabel, height: .greatestFiniteMagnitude)
        let size = label.sizeThatFits(maxSize)
        
        return size.height
    }
    
}
