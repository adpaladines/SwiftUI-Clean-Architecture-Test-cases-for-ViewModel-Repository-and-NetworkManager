//
//  FruitListViewModel.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/11/23.
//

import UIKit

class FruitListViewModel {

    var networkManager: NetworkAbleProtocol
    var delegate: SrcreenRefreshProtocol?
    var fruitsList: [Fruit]?
    var colorsList: [UIColor]?
//    var urlString: String? // property injection
    
    init(networkManager: NetworkAbleProtocol) { //constructor injection
        self.networkManager = networkManager
    }
    
    func fetchDataWithProtocol(urlString: String) { //function dependency injextion
        networkManager.networkDelegate = self
        networkManager.fetchDataWithDelegate(from: urlString, type: [Fruit].self)
        
    }
    
    func fetchData(urlString: String) { //function dependency injextion
        networkManager.networkDelegate = self
        
        networkManager.fetchData(from: urlString, type: [Fruit].self) { result in
            
        }
        
    }
    
}

extension FruitListViewModel: NetworkResponseProtocol {

    func didReceiveError(error: Error) {
        
    }
    
    func didReceivedDataFromAPI<T>(data: T) where T : Decodable {
        guard let fruits = data as? [Fruit] else {
            return
        }
        fruitsList = fruits
        colorsList = fruits.compactMap({ _ in PastelColorGenerator.shared.nextColor })
        delegate?.refreshUI()
    }
    
}
