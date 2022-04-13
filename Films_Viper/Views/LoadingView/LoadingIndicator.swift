//
//  LoadingIndicator.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

class LoadingIndicator: UIActivityIndicatorView {
     
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.hidesWhenStopped = true
        self.style = UIActivityIndicatorView.Style.medium
        self.color = .white
        
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

