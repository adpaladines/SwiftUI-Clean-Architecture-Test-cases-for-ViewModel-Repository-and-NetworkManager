//
//  Fruit.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

import Foundation

struct Fruit: Codable {
    let name: String
    let id: Int
    let family, order, genus: String
    let nutritions: Nutritions
}

struct Nutritions: Codable {
    let calories: Int
    let fat, sugar, carbohydrates, protein: Double
}
