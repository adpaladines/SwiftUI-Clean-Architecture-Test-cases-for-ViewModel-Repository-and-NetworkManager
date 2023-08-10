//
//  PokemonRepositoryAction.swift
//  MVVMAPICallSwiftUI
//
//  Created by andres paladines on 8/9/23.
//

import Foundation

protocol PokemonRepositoryAction {
    func getListOfDigimons(urlString: String) async throws -> [Digimon]
}

class PokemonRepository {
    
    var networkManager: NetworkAbleProtocol
    
    init(networkManager: NetworkAbleProtocol) {
        self.networkManager = networkManager
    }
    
}
