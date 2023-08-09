//
//  JsonManager.swift
//  MVVMFruitsApi
//
//  Created by Andres D. Paladines on 7/11/23.
//

import Foundation

class JsonManager: NetworkAbleProtocol {
    
    var networkDelegate: NetworkResponseProtocol?

    func fetchDataWithDelegate<T>(from fileName: String, type: T.Type) where T : Decodable {
        let bundle = Bundle(for: JsonManager.self)
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            networkDelegate?.didReceiveError(error: NSError())
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let userModelArray = try JSONDecoder().decode(type.self, from: data)
            networkDelegate?.didReceivedDataFromAPI(data: userModelArray)
        }catch {
            print(error.localizedDescription)
            networkDelegate?.didReceiveError(error: error)
            return
        }
    }
    
    
    func fetchData<T>(from urlString: String, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let bundle = Bundle(for: JsonManager.self)
        guard let url = bundle.url(forResource: "jsonData", withExtension: "JSON") else {
            completion(.failure(NSError()))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let userModelArray = try JSONDecoder().decode(type.self, from: data)
            completion(.success(userModelArray))
        }catch {
            print(error.localizedDescription)
            completion(.failure(error))
            return
        }
    }
    
        
}
