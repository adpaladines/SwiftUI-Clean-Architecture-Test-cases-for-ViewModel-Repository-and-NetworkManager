//
//  NetworkResponseProtocol.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

import Foundation

protocol NetworkResponseProtocol {
    func didReceiveError(error: Error)
    func didReceivedDataFromAPI<T: Decodable>(data: T)
    
//    associatedtype Item
//    func didReceivedDataFromAPI(data: Item)
}

//protocol NetworkFetctch: NetworkResponseProtocol {
//    func fetchData()
//}
//
//protocol NetworkPost: NetworkResponseProtocol {
//    
//    func post(item: Item)
//}
