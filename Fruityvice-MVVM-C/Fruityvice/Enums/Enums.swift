//
//  Enums.swift
//  Fruityvice
//
//  Created by andres paladines on 8/7/23.
//

import Foundation

enum StoryboardName {
    case fruits(FruitsViewControllerName)
    case fruitDetails(FruitDetailsControllerName)
    
    var name: String {
        switch self {
        case .fruits:
            return "Fruits"
        case .fruitDetails:
            return "FruitDetails"
        }
    }
    
    var vcName: String {
        switch self {
        case .fruitDetails(let name):
            return name.rawValue
        case .fruits(let name):
            return name.rawValue
        }
    }
}

enum FruitsViewControllerName: String {
    case list = "FruitsViewController"
}

enum FruitDetailsControllerName: String {
    case tabController = "FruitDetailsTabController"
    case info = "FruitDetailsTableViewController"
    case wiki = "FruitDetailsWikiViewController"
}
