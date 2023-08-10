//
//  DigimonRepository.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/9/23.
//

import Foundation

extension PokemonRepository: PokemonRepositoryAction {
    
    func getListOfDigimons() async throws -> [Digimon] {
        do {
            let pokemonRequest = DigimonRequest(path: APIEndPoint.apiPath + APIEndPoint.gigimonsPath)
            
            let data = try await networkManager.getDataFromApi(urlRequest: pokemonRequest)
            let digimonList = try JSONDecoder().decode([Digimon].self, from: data)
            return digimonList
        }catch let error {
            throw error
        }
    }
    
}
