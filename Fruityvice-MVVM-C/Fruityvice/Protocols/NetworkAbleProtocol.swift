//
//  NetworkAbleProtocol.swift
//  MVVMFruitsApi
//
//  Created by Andres D. Paladines on 7/11/23.
//

import Foundation

protocol NetworkAbleProtocol {
    var networkDelegate: NetworkResponseProtocol? { get set }

    func fetchDataWithDelegate<T: Decodable>(from urlString: String, type: T.Type)
    
    func fetchData<T: Decodable>(from urlString: String, type: T.Type, completion: @escaping ( Result<T, Error> ) -> Void)
    
}
