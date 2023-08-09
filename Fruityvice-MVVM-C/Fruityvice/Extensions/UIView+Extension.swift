//
//  UIView+Extension.swift
//  Fruityvice
//
//  Created by andres paladines on 7/7/23.
//

import UIKit

extension UIView {
    
    func applyShadow(color: UIColor = .gray, cornerRadius: CGFloat, opacity: Float = 0.30) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 3.0
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
