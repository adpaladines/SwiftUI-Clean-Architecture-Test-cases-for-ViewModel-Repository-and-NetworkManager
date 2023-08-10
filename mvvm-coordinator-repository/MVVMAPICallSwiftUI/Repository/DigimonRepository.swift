//
//  DigimonRepository.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 8/9/23.
//

import Foundation

extension PokemonRepository: PokemonRepositoryAction {
    
    func getListOfDigimons(urlString: String) async throws -> [Digimon] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrlError
        }
        
        do {
            let urlRequest = URLRequest(url: url)
            let data = try await networkManager.getDataFromApi(urlRequest: urlRequest)
            let digimonList = try JSONDecoder().decode([Digimon].self, from: data)
            return digimonList
        }catch let error {
            throw error
        }
    }
    
}
