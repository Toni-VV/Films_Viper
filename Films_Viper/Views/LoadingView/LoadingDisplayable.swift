//
//  LoadingDisplayableProtocol.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

protocol LoadingDisplayable {
    
    var loadingIndicator: LoadingIndicator { get }
    func setLoading(_ isVisible: Bool)
    
}

extension LoadingDisplayable {
    
    func setLoading(_ isVisible: Bool) {
        isVisible ? loadingIndicator.startAnimating(): loadingIndicator.stopAnimating()
    }
    
}
