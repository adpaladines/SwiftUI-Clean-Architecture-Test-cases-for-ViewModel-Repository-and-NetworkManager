//
//  NetworkManager.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

import Foundation

class NetworkManager {
    
    var networkDelegate: NetworkResponseProtocol?
    
}

extension NetworkManager: NetworkAbleProtocol {
    
    func fetchDataWithDelegate<T: Decodable>(from urlString: String, type: T.Type) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: url) { data, urlResp, error in
            
            if let error_ = error {
                print(error_.localizedDescription)
                self.networkDelegate?.didReceiveError(error: error_)
                return
            }
            
            guard let httpResponse = urlResp as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = NSError(domain: "Request Failed", code: 404)
                self.networkDelegate?.didReceiveError(error: error)
                return
            }
            
            guard httpResponse.statusCode != 404 else {
                let error = NSError(domain: "No data fetched", code: 404)
                self.networkDelegate?.didReceiveError(error: error)
                return
            }
            
            guard let apiData = data else {
                let error = NSError(domain: "No data fetched", code: 404)
                self.networkDelegate?.didReceiveError(error: error)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(type, from: apiData)
                self.networkDelegate?.didReceivedDataFromAPI(data: decodedData)
            }catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    
    
    func fetchData<T: Decodable>(from urlString: String, type: T.Type, completion: @escaping ( Result<T, Error> ) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: url) { data, urlResp, error in
            
            if let error_ = error {
                print(error_.localizedDescription)
                completion(.failure(error_))
                return
            }
            
            guard let httpResponse = urlResp as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                completion(nil)
                let error = NSError(domain: "Request Failed", code: 404)
                completion(.failure(error))
                return
            }
            
            guard httpResponse.statusCode != 404 else {
//                completion([])
                return
            }
            
            guard let apiData = data else {
                completion(.failure( NSError() ))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(type, from: apiData)
                completion(.success(decodedData))
            }catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }

    
}
