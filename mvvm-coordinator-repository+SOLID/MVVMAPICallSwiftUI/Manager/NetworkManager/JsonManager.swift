//
//  JsonManager.swift
//  MVVMFruitsApi
//
//  Created by Andres D. Paladines on 7/11/23.
//

import Foundation

class JsonManager: NetworkAbleProtocol {
    
    var networkDelegate: NetworkResponseProtocol?
    
    func getDataFromApi(urlRequest: Requestable) async throws -> Data {
        guard let request = urlRequest.createURLRequest() else {
            throw NetworkError.invalidUrlError
        }
        let bundle = Bundle(for: JsonManager.self)
        guard let url = bundle.url(forResource: request.url!.absoluteString, withExtension: "json") else {
            throw NetworkError.invalidUrlError
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        }catch {
            print(error.localizedDescription)
            throw error
        }
    }
        
}
