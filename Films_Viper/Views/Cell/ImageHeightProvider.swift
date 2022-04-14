//
//  ImageHeightProvider.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

class ImageDataProvider {
    
    static let shared = ImageDataProvider()
    
    var height: CGFloat
    
    private init() {
        height = .zero
    }
    
}

