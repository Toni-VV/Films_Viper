//
//  UIImageView+.swift
//  Films_Viper
//
//  Created by Антон Волков on 14.04.2022.
//

import UIKit

extension UIImageView {
    
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
