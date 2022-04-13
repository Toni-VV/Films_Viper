//
//  UIViewController+.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarTitle(_ title: String, andImage image: UIImage) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: NavBarConstants.fontName, size: NavBarConstants.fontSize)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        
        let titleView = UIStackView(arrangedSubviews: [titleLabel, imageView])
        titleView.axis = .horizontal
        titleView.spacing = 1
        navigationItem.titleView = titleView
    }
    
}
