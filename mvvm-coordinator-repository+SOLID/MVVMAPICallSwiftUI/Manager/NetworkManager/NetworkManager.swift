//
//  NetworkManager.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import Foundation

class NetworkManager {
    
    var urlSession: NetworkManagersessionable
    
    init(urlSession: NetworkManagersessionable = URLSession.shared) {
        self.urlSession = urlSession
    }
    
}

extension NetworkManager: NetworkAbleProtocol {

    func getDataFromApi(urlRequest: Requestable) async throws -> Data {
        do {
            guard let request = urlRequest.createURLRequest() else {
                throw NetworkError.invalidUrlError
            }
            let (data, response) = try await urlSession.getData(for: request, delegate: nil)
            guard response.isValidUrlResponse() else {
                throw NetworkError.responseError
            }
            return data
        } catch {
            print(error.localizedDescription)
            throw NetworkError.dataNotFoundError
        }
    }
}

