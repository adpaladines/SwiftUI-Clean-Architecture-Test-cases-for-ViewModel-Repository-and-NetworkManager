//
//  EndPoint.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

import Foundation

struct Api {
    static let shared = Api()
    let base = "https://fruityvice.com/"
    let getAll = "api/fruit/all"
    let wikiSearch = "https://en.wikipedia.org/w/index.php?search="
}
