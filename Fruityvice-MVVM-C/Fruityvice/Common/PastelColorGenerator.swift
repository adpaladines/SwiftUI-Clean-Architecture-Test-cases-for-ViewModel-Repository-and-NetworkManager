//
//  PastelColorGenerator.swift
//  Fruityvice
//
//  Created by andres paladines on 7/7/23.
//

import UIKit

class PastelColorGenerator {
    
    static let shared = PastelColorGenerator()
    private var index = 0
    
    private var pastelColors: [String] = [
        "BFE4D4",  // Mint Green
        "DBDBC8",  // Pale Yellow
        "EDBDAE",  // Peach
        "C0C9DD",  // Sky Blue
        "EBBECF",  // Lavender
        "E5D0C8",  // Light Gray
        "C1D1C7",  // Pale Green
        "E293D4",  // Light Purple
        "D0C5CC",  // Lilac
        "D9E4EE",  // Baby Blue
        "F29B9B",  // Blush Pink
        "CBE1E1",  // Aquamarine
        "D6CCCC",  // Rose Quartz
        "E0D8B8",  // Beige
        "E5E5CC",  // Vanilla
        "D0E5D0",  // Pastel Green
        "D1CEC4",  // Sand
        "EED0E5",  // Pale Pink
        "B8D7E0",  // Powder Blue
        "CCECD9",  // Seafoam Green
        "DBC6CF",  // Cotton Candy
        "E0CDB8",  // Champagne
        "CCE1E6",  // Light Blue
        "D8B8E5",  // Orchid
        "CFCFDB",  // Periwinkle
        "C1DACF"   // Mint
    ]
    
    var randomColor: UIColor {
        let randomIndex = Int.random(in: 0..<pastelColors.count)
        return UIColor(hex: pastelColors[randomIndex])
    }
    
    var nextColor: UIColor {
        let nextColor = UIColor(hex: pastelColors[index])
        index = index >= 25 ? 0 : index + 1
        return nextColor
    }
    
    func shufleColors() {
        pastelColors.shuffle()
    }
}
