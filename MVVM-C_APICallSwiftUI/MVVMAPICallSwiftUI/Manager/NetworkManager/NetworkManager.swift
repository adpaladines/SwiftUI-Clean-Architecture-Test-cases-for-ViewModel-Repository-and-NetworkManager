//
//  NetworkManager.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

class NetworkManager {
    
    var networkDelegate: NetworkResponseProtocol?
    
}

extension NetworkManager: NetworkAbleProtocol {

    func getDataFromApi(urlRequest:URLRequest) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            print(error.localizedDescription)
            throw NetworkError.dataNotFoundError
        }
    }
    
}

