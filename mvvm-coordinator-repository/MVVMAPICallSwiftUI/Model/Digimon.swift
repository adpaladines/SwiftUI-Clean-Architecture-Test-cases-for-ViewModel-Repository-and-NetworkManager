//
//  Digimon.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

struct Digimon: Decodable {
    
    let name: String
    let img: String
    let level: String
}

extension Digimon: Identifiable {
    var id: UUID {
        return UUID()
    }
}

